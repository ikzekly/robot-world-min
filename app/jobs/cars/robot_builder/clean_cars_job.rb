# frozen_string_literal: true

module Cars
  module RobotBuilder
    class CleanCarsJob
      include Sidekiq::Worker

      sidekiq_options retry: 1

      def perform
        batch_size = 1000
        cars = FactoryStock.instance.cars

        cars.transaction do
          ((cars.count / batch_size) + 1).times { cars.limit(batch_size).delete_all }
        end
      end
    end
  end
end
