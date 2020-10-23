# frozen_string_literal: true

RSpec.describe Order, type: :model do
  let(:order) { build(:order) }

  describe 'valid?' do
    it { expect(order).to be_valid }
  end

  context 'associations' do
    it { expect(order).to respond_to(:event_logs) }
    it { expect(order).to respond_to(:car) }
    it { expect(order).to respond_to(:car_model) }
  end
end
