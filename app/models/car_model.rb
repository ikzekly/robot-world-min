# frozen_string_literal: true

class CarModel < ApplicationRecord
  NAMES = [
    'Ford Mustang', 'Pagani Huayra', 'Chevrolet Camaro',
    'Tesla Model 3', 'Lamborghini Countach', 'Dodge Viper',
    'Chevrolet Corvette', 'Volkswagen Beetle', 'Porsche Carrera GT', 'Lamborghini Diablo'
  ].freeze

  has_many :cars
  has_many :orders

  validates :name, inclusion: { in: NAMES }, uniqueness: true

  def self.random_instance
    find(pluck(:id).sample)
  end
end
