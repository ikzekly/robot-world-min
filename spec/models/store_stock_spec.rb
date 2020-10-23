# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoreStock, type: :model do
  let(:store_stock) { build(:store_stock) }

  describe 'valid?' do
    it { expect(store_stock).to be_valid }
  end

  context 'associations' do
    it { expect(store_stock).to respond_to(:cars) }
  end
end
