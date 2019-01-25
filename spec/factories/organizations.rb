# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    user
    name { 'MyString' }
    description { 'MyText' }
  end
end
