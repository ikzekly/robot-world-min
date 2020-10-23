# frozen_string_literal: true

module Cars
  module RobotBuyer
    class BuyJob
      include Sidekiq::Worker

      sidekiq_options retry: 1

      def perform
        rand(1..10).times { Operations::Cars::RobotBuyer.buy }
      end
    end
  end
end
