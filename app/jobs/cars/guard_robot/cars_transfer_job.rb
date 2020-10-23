# frozen_string_literal: true

module Cars
  module GuardRobot
    class CarsTransferJob
      include Sidekiq::Worker

      sidekiq_options retry: 1

      def perform
        FactoryStock.instance.cars.update_all(store_stock_id: StoreStock.instance.id, factory_stock_id: nil)
      end
    end
  end
end
