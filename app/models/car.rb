# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :car_model

  validates :year, numericality: true, inclusion: { in: 1960..2020 }
end
