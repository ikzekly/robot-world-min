# frozen_string_literal: true

FactoryBot.define do
  factory :car_computer do
    car

    defected_part { nil }

    trait :with_defect do
      defected_part { Car::PARTS.sample }
    end
  end
end
