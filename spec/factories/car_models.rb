# frozen_string_literal: true

FactoryBot.define do
  factory :car_model do
    name { CarModel::NAMES.sample }
  end
end
