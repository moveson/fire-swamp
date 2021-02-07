# frozen_string_literal: true

require "rails_helper"

RSpec.describe "log in", type: :system do
  let(:initial_path) { new_user_session_path }
  let(:username) { "rousguy" }
  let(:password) { "12345678" }
  before { create(:user, username: username, password: password, password_confirmation: password) }

  scenario "User with proper credentials can log in" do
    visit initial_path

    fill_in "Username", with: username
    fill_in "Password", with: password
    click_button "Log in"

    validate_user_logged_in
  end

  scenario "User with incorrect password cannot log in" do
    visit initial_path

    fill_in "Username", with: username
    fill_in "Password", with: "random password"
    click_button "Log in"

    validate_user_not_logged_in
  end

  scenario "User with unknown username cannot log in" do
    visit initial_path

    fill_in "Username", with: "random username"
    fill_in "Password", with: password
    click_button "Log in"

    validate_user_not_logged_in
  end

  def validate_user_logged_in
    expect(current_path).to eq authenticated_root_path
  end

  def validate_user_not_logged_in
    expect(current_path).to eq initial_path
    expect(page).to have_content("Invalid Username or password")
  end
end
