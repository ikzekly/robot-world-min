# frozen_string_literal: true

class EventLog < ApplicationRecord
  belongs_to :order
end
