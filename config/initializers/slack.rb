# frozen_string_literal: true

SlackClient = Slack::Webhooks::Client.new(
  url: ENV['SLACK_WEBHOOK_URL'],
  timeout: ENV['SLACK_CLIENT_TIMEOUT']
)
