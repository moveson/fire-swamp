# frozen_string_literal: true

require "rails_helper"

RSpec.describe "visit the chat page", type: :system, js: true do
  let(:user) { create(:user) }

  scenario "Visitor attempting to access the chat page is redirected to the sign in page" do
    visit messages_path

    expect(current_path).to eq new_user_session_path
  end

  scenario "User is permitted to visit the chat page and enter a message" do
    login_as user, scope: :user
    visit messages_path

    expect(current_path).to eq messages_path
    expect(page).to have_field("message_content")

    existing_count = ::Message.count
    fill_in("message_content", with: "Something witty\n")
    sleep 0.5

    expect(::Message.count).to eq(existing_count + 1)
    expect(::Message.last.content).to eq("Something witty")
    expect(page).to have_content(user.username)
    expect(page).to have_content("Something witty")
  end
end
