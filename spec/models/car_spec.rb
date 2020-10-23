# frozen_string_literal: true

RSpec.describe Car, type: :model do
  let(:car) { build(:car) }

  describe 'valid?' do
    it { expect(car).to be_valid }
  end

  context 'associations' do
    it { expect(car).to respond_to(:car_model) }
    it { expect(car).to respond_to(:car_computer) }
    it { expect(car).to respond_to(:factory_stock) }
  end

  context 'with defects' do
    let(:car) { build(:car, car_computer: build(:car_computer)) }

    it "doesn't transition to complete" do
      expect { car.complete }.to raise_error(AASM::InvalidTransition)
    end

    it 'transitions to defected' do
      car.fail

      expect(car).to be_defected
    end
  end

  context 'without defects' do
    let(:car) { build(:car) }

    it 'transition to complete' do
      car.base_build
      car.build_electric
      car.finalize
      car.complete

      expect(car).to be_complete
    end

    it "doesn't transition to defected" do
      expect { car.fail }.to raise_error(AASM::InvalidTransition)
    end
  end
end
