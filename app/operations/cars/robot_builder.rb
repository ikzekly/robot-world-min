# frozen_string_literal: true

module Operations
  module Cars
    class RobotBuilder
      def initialize(car)
        @car = car
      end

      def call
        return build_basics if car.may_base_build?
        return build_electrics if car.may_build_electric?
        return build_finals if car.may_finalize?

        defects_probability = ::Cars::DefectsProbability.build

        if defects_probability.defect_found?
          car.build_car_computer(defected_part: defects_probability.defected_part)
        end

        car.may_complete? ? complete : car.fail
      end

      private

      attr_reader :car

      def build_basics
        car.assign_attributes(build_basic_attributes)
        car.base_build
      end

      def build_electrics
        car.assign_attributes(build_electric_attributes)
        car.build_electric
      end

      def build_finals
        car.assign_attributes(build_finals_attributes)
        car.finalize
      end

      def complete
        car.complete
        car.send(:broadcast, :completed, car.id)
      end

      def build_basic_attributes
        {
          car_model: CarModel.find(CarModel.pluck(:id).sample),
          year: rand(1960..2020),
          wheels: 4,
          seats: 2,
          chassis: 1,
          engine: 1
        }
      end

      def build_electric_attributes
        {
          laser: 1,
          computer: 1
        }
      end

      def build_finals_attributes
        {
          price: rand(200.0..1000.0),
          cost_price: rand(20.0..100.0)
        }
      end
    end
  end
end
