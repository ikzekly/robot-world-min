# frozen_string_literal: true

module Cars
  module SlackNotifier
    extend self

    def call(message)
      SlackClient.call(method: :post, path: nil, payload: build_payload(message))
    end

    private

    def build_payload(message)
      {
        "blocks": [
          {
            "type": 'section',
            "text": {
              "text": message,
              "type": 'mrkdwn'
            }
          }
        ]
      }
    end
  end
end
