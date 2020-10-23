# frozen_string_literal: true

module Cars
  module RobotBuilder
    class BuildJob
      include Sidekiq::Worker

      sidekiq_options retry: 1

      def perform
        10.times do
          car = Car.new

          car.transaction do
            rand(1..4).times { Operations::Cars::RobotBuilder.new(car).call }

            car.save!
          end

          car.send(:broadcast, :completed, car.id) if car.completed?
          car.send(:broadcast, :defected, car.id) if car.defected?
        end
      end
    end
  end
end
