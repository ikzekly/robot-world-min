# frozen_string_literal: true

RSpec.describe Cars::SlackNotifier do
  subject(:notifier) { described_class }

  describe '.call' do
    let(:message) { 'whatever' }

    it 'sends notification' do
      expect(SlackClient).to receive(:call)

      described_class.call(message)
    end
  end
end
