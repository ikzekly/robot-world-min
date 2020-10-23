# frozen_string_literal: true

class StoreStock < ApplicationRecord
  has_many :cars

  validate :singleton_check

  def self.instance
    StoreStock.first_or_create!
  end

  private

  def singleton_check
    return unless StoreStock.unscoped.exists?

    errors.add(:base, 'just one StoreStock object allowed')
  end
end
