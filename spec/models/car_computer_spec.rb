# frozen_string_literal: true

RSpec.describe CarComputer, type: :model do
  let(:car_computer) { build(:car_computer) }

  describe 'valid?' do
    it { expect(car_computer).to be_valid }
  end

  context 'associations' do
    it { expect(car_computer).to respond_to(:cars) }
  end
end
