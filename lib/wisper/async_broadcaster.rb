# frozen_string_literal: true

module Wisper
  class AsyncBroadcaster
    class Wrapper
      include Sidekiq::Worker

      sidekiq_options retry: 1

      def perform(class_name, event, args)
        listener = class_name.constantize
        listener.public_send(event, *args)
      end
    end

    attr_reader :queue

    def initialize(queue)
      @queue = queue
    end

    def broadcast(subscriber, _publisher, event, args)
      Wrapper.set(queue: queue).perform_async(subscriber.name, event, args)
    end
  end
end
