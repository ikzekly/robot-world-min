# frozen_string_literal: true

class Car < ApplicationRecord
  include AASM

  belongs_to :car_model

  validates :year, numericality: true, inclusion: { in: 1960..2020 }

  aasm column: :state do
    state :new, initial: true

    state :basic_structure
    state :electronic_devices
    state :painting_and_final_details

    state :complete
    state :damaged

    event :base_build do
      transitions from: :new, to: :basic_structure
    end

    event :build_electic do
      transitions from: :basic_structure, to: :electronic_devices
    end

    event :finalize do
      transitions from: :electronic_devices, to: :painting_and_final_details
    end

    event :complete do
      transitions from: :painting_and_final_details, to: :complete
    end

    event :fail do
      transitions from: %i[new basic_structure electronic_devices painting_and_final_details], to: :damaged
    end
  end
end
