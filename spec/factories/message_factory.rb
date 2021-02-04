# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    association :author, factory: :user
    content { "Hello world" }
  end
end
