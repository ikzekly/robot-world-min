# frozen_string_literal: true

FactoryBot.define do
  factory :car_model do
    name { CarModel::NAMES.sample }

    trait :ford_mustang do
      name { 'Ford Mustang' }
    end

    trait :chevrolet_camaro do
      name { 'Chevrolet Camaro' }
    end
  end
end
