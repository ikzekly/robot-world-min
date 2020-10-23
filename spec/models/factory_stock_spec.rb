# frozen_string_literal: true

RSpec.describe FactoryStock, type: :model do
  let(:factory_stock) { build(:factory_stock) }

  describe 'valid?' do
    it { expect(factory_stock).to be_valid }
  end

  context 'associations' do
    it { expect(factory_stock).to respond_to(:cars) }
  end

  describe '#cars_by_models_count' do
    let(:factory_stock) { create(:factory_stock) }

    before do
      ford_mustang = create(:car_model, :ford_mustang)
      chevrolet_camaro = create(:car_model, :chevrolet_camaro)

      factory_stock.cars << create_list(:car, 2, :completed, car_model: ford_mustang)
      factory_stock.cars << create_list(:car, 2, :completed, car_model: chevrolet_camaro)
    end

    it 'returns count of cars by models' do
      expect(factory_stock.cars_by_models_count).to include('Chevrolet Camaro' => 2, 'Ford Mustang' => 2)
    end
  end
end
