# frozen_string_literal: true

class FactoryStock < ApplicationRecord
  has_many :cars

  before_create :singleton_check

  def self.instance
    FactoryStock.first_or_create!
  end

  def cars_by_models_count
    cars.joins(:car_model)
      .where(cars: { state: :completed })
      .group('car_models.name')
      .count
  end

  private

  def singleton_check
    return unless FactoryStock.unscoped.exists?

    errors.add(:base, 'just one FactoryStock object allowed')
  end
end
