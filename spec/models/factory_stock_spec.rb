# frozen_string_literal: true

RSpec.describe FactoryStock, type: :model do
  let(:factory_stock) { build(:factory_stock) }

  describe 'valid?' do
    it { expect(factory_stock).to be_valid }
  end

  context 'associations' do
    it { expect(factory_stock).to respond_to(:cars) }
  end
end
