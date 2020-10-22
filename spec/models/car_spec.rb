# frozen_string_literal: true

RSpec.describe Car, type: :model do
  let(:car) { build(:car) }

  describe 'valid?' do
    it { expect(car).to be_valid }
  end

  context 'associations' do
    it { expect(car).to respond_to(:car_model) }
  end
end
