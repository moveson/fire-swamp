# frozen_string_literal: true

require "rails_helper"

RSpec.describe "sign up", type: :system do
  let(:initial_path) { new_user_registration_path }
  let(:sign_up_token) { "token" }
  before { allow(::FireSwampConfig).to receive(:sign_up_token).and_return(sign_up_token) }

  scenario "Visitor with proper sign up token can create a user" do
    visit initial_path

    fill_in "Username", with: "new rous"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    fill_in "Sign up token", with: sign_up_token

    validate_user_created
  end

  scenario "Visitor without proper sign up token cannot create a user" do
    visit initial_path

    fill_in "Username", with: "new rous"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    fill_in "Sign up token", with: "not the correct token"

    validate_user_not_created
  end

  scenario "Visitor that provides no sign up token cannot create a user" do
    visit initial_path

    fill_in "Username", with: "new rous"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    validate_user_not_created
  end

  def validate_user_created
    expect { click_button "Sign up" }.to change { User.count }.by 1
    expect(current_path).to eq authenticated_root_path
  end

  def validate_user_not_created
    expect { click_button "Sign up" }.not_to(change { User.count })
    expect(current_path).to eq initial_path
    expect(page).to have_content("Invalid sign up token")
  end
end
