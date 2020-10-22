# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    car_model

    year { [1960, 2020].sample }

    wheels { 4 }
    chassis { 1 }
    laser { 1 }
    computer { 1 }
    engine { 1 }

    price { 20.5 }

    cost_price { 7.2 }
  end
end
