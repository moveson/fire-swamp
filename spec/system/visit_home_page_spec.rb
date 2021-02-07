# frozen_string_literal: true

require "rails_helper"

RSpec.describe "visit the home page", type: :system do
  let(:user) { create(:user) }

  scenario "Visitor is redirected to the sign in page" do
    visit authenticated_root_path

    expect(current_path).to eq unauthenticated_root_path
  end

  scenario "User is permitted to visit the home page" do
    login_as user, scope: :user
    visit authenticated_root_path

    expect(current_path).to eq authenticated_root_path
  end
end
