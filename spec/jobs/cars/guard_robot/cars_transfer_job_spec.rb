# frozen_string_literal: true

RSpec.describe Cars::GuardRobot::CarsTransferJob do
  subject(:job) { described_class.new }

  before do
    FactoryStock.instance.cars << create_list(:car, 2, :completed)
  end

  describe '#perform' do
    it { expect { job.perform }.to change { StoreStock.instance.cars.count }.from(0).to(2) }
    it { expect { job.perform }.to change { FactoryStock.instance.cars.count }.from(2).to(0) }
  end
end
