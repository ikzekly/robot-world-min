# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    car_model
    year { [1960, 2020].sample }

    trait :basic_structure do
      car_model

      state { 'basic_structure' }

      year { [1960, 2020].sample }
      wheels { 4 }
      seats { 2 }
      chassis { 1 }
      engine { 1 }
    end

    trait :electronic_devices do
      state { 'electronic_devices' }

      laser { 1 }
      computer { 1 }
    end

    trait :painting_and_final_details do
      state { 'painting_and_final_details' }
    end

    trait :completed do
      state { 'completed' }
    end

    trait :defected do
      car_computer

      state { 'defected' }
    end
  end
end
