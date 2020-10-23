# frozen_string_literal: true

class FactoryStock < ApplicationRecord
  has_many :cars

  def cars_by_models_count
    cars.joins(:car_model)
      .where(cars: { state: :completed })
      .group('car_models.name')
      .count
  end
end
