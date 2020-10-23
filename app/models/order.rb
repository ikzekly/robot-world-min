# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :event_log

  belongs_to :car, optional: true
  belongs_to :car_model
end
