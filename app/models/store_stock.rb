# frozen_string_literal: true

class StoreStock < ApplicationRecord
  has_many :cars

  before_create do
    errors.add(:base, 'just one StoreStock object allowed') and return false if StoreStock.exists?
  end

  def self.instance
    StoreStock.first_or_create!
  end
end
