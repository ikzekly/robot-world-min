# frozen_string_literal: true

class CarModel < ApplicationRecord
  NAMES = [
    'Ford Mustang', 'Pagani Huayra', 'Chevrolet Camaro',
    'Tesla Model 3', 'Lamborghini Countach', 'Dodge Viper',
    'Chevrolet Corvette', 'Volkswagen Beetle', 'Porsche Carrera GT', 'Lamborghini Diablo'
  ].freeze

  has_many :cars

  validates :name, inclusion: { in: NAMES }
end
