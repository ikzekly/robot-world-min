# frozen_string_literal: true

module FactoryStocks
  module CarsListener
    module_function

    def completed(id)
      car = Car.find(id)

      return unless car

      FactoryStock.instance.cars << car
    end
  end
end
