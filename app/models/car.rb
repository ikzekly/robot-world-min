# frozen_string_literal: true

class Car < ApplicationRecord
  PARTS = %w[wheels chassis laser computer engine seats].freeze

  include AASM

  has_one :car_computer, dependent: :destroy
  belongs_to :car_model
  belongs_to :factory_stock, optional: true

  validates :year, numericality: true, inclusion: { in: 1960..2020 }, allow_nil: true

  aasm column: :state do
    state :new, initial: true

    state :basic_structure
    state :electronic_devices
    state :painting_and_final_details

    state :completed
    state :defected

    event :base_build do
      transitions from: :new, to: :basic_structure
    end

    event :build_electric do
      transitions from: :basic_structure, to: :electronic_devices
    end

    event :finalize do
      transitions from: :electronic_devices, to: :painting_and_final_details
    end

    event :complete do
      transitions from: :painting_and_final_details, to: :completed do
        guard { !any_defect? }
      end
    end

    event :fail do
      transitions to: :defected, guard: :any_defect?
    end
  end

  private

  def any_defect?
    car_computer&.defected_part
  end
end
