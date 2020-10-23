# frozen_string_literal: true

Wisper.configure do |config|
  config.broadcaster(:cars, Wisper::AsyncBroadcaster.new(:default))
end

Rails.application.configure do
  config.after_initialize do
    Car.subscribe(FactoryStocks::CarsListener, broadcaster: :cars)
  end
end
