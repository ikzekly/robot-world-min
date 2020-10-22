# frozen_string_literal: true

RSpec.describe CarModel, type: :model do
  let(:car_model) { build(:car_model) }

  describe 'valid?' do
    it { expect(car_model).to be_valid }
  end

  context 'associations' do
    it { expect(car_model).to respond_to(:cars) }
  end
end
