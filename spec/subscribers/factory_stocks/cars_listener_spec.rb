# frozen_string_literal: true

RSpec.describe FactoryStocks::CarsListener do
  subject(:listener) { described_class }

  let(:factory_stock) { FactoryStock.instance }
  let(:car) { create(:car, :completed) }

  describe '.completed' do
    it 'adds car to factory stock' do
      expect { listener.completed(car.id) }.to change { factory_stock.cars.count }.by(1)
    end
  end
end
