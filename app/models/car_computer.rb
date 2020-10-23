# frozen_string_literal: true

class CarComputer < ApplicationRecord
  belongs_to :car, dependent: :destroy

  validates :defected_part, inclusion: { in: Car::PARTS }
end
