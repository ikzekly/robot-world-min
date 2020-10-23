# frozen_string_literal: true

module Cars
  module RobotBuilder
    class CleanCarsJob
      include Sidekiq::Worker

      sidekiq_options retry: 1

      def perform
        batch_size = 1000
        ((Car.count / batch_size) + 1).times { Car.limit(batch_size).delete_all }
      end
    end
  end
end
