# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    user
    content { "Hello world" }
  end
end
