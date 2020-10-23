# frozen_string_literal: true

class FactoryStock < ApplicationRecord
  has_many :cars

  before_create do
    errors.add(:base, 'just one FactoryStock object allowed') and return false if FactoryStock.exists?
  end

  def self.instance
    FactoryStock.first_or_create!
  end

  def cars_by_models_count
    cars.joins(:car_model)
      .where(cars: { state: :completed })
      .group('car_models.name')
      .count
  end
end
