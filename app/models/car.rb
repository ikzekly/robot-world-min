# frozen_string_literal: true

class Car < ApplicationRecord
  PARTS = %w[wheels chassis laser computer engine seats].freeze

  include AASM

  has_one :car_computer
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
      transitions from: :painting_and_final_details, to: :complete do
        guard { !any_defect? }
      end
    end

    event :fail do
      transitions to: :damaged, guard: :any_defect?
    end
  end

  private

  def any_defect?
    return false if car_computer&.defected_part.blank?

    true
  end
end
