# frozen_string_literal: true

FactoryBot.define do
  factory :car_computer do
    car

    defected_part { Car::PARTS.sample }
  end
end
