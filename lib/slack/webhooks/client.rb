# frozen_string_literal: true

module Slack
  module Webhooks
    class Client
      def initialize(url:, timeout:)
        @url = url
        @timeout = timeout
      end

      def call(method:, path: nil, payload: nil)
        payload = payload&.to_json unless method == :get
        response = connection.public_send(method, path, payload, nil)

        JSON.parse(response.body)
      rescue JSON::ParserError
        response.body
      rescue Faraday::ClientError => e
        log_message(e.message)
      end

      private

      attr_reader :url, :timeout

      def connection
        @connection ||= Timeout.timeout(timeout.to_i) do
          Faraday.new(url: url) do |f|
            f.response(:raise_error)
            f.adapter(Faraday.default_adapter)
            f.headers = { 'Content-Type': 'application/json' }
          end
        end
      end

      def log_message(message)
        Rails.logger.tagged(self.class.name) { Rails.logger.info(message) }
      end
    end
  end
end
