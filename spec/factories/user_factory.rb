# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    email { "fake_email@example.com" }
    username { "fake_username" }
    password { "12345678" }
  end
end
