# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    username { Faker::Internet.username }
    password { "12345678" }
  end
end
