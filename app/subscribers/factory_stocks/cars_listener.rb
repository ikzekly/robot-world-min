# frozen_string_literal: true

module FactoryStocks
  module CarsListener
    extend self

    def completed(id)
      car = Car.find(id)

      return unless car.completed?

      FactoryStock.instance.cars << car
    end
  end
end
