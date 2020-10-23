# frozen_string_literal: true

module RobotGuard
  module CarsListener
    extend self

    def defected(id)
      car = Car.find(id)

      return unless car.defected?

      Cars::SlackNotifier.call(build_message(car))
    end

    private

    def build_message(car)
      <<~TEXT
        Car with id: *#{car.id}* has a *#{car.car_computer.defected_part}* defect
        model name: *#{car.car_model.name}*
      TEXT
    end
  end
end
