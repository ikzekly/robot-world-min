# frozen_string_literal: true

EXCEPT_WISPER_LIST = [
  FactoryStocks::CarsListener
].freeze

Wisper::GlobalListeners.registrations.delete_if do |registration|
  registration.listener.in?(EXCEPT_WISPER_LIST)
end
