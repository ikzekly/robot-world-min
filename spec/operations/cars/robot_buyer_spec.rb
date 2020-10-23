# frozen_string_literal: true

RSpec.describe Operations::Cars::RobotBuyer do
  subject(:operation) { described_class }

  context 'car in stock' do
    let(:car) { create(:car, :completed, car_model: create(:car_model)) }

    before do
      StoreStock.instance.cars << car
    end

    it 'creates order' do
      expect { operation.buy }.to change { Order.count }
    end

    it 'removes car form storage' do
      expect { operation.buy }.to change { car.reload.store_stock_id }.to nil
    end
  end

  context 'car out of stock' do
    before do
      create(:car_model)
    end

    it 'creates order' do
      expect { operation.buy }.to change { Order.count }
    end

    it 'creates event log' do
      expect { operation.buy }.to change { EventLog.count }
    end
  end
end
