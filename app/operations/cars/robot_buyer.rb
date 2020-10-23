# frozen_string_literal: true

module Operations
  module Cars
    module RobotBuyer
      extend self

      def buy
        order = Order.new(car_model: CarModel.random_instance)

        order.transaction do
          car = StoreStock.instance.cars.joins(:car_model).where(car_model: order.car_model).take

          return handle_event!(order) unless car

          order.car = car
          car.store_stock_id = nil

          order.save!
          car.save!
        end
      end

      private

      def handle_event!(order)
        order.build_event_log
        order.save!
      end
    end
  end
end
