# frozen_string_literal: true

RSpec.describe Wisper::AsyncBroadcaster do
  subject(:broadcaster) { described_class.new(queue) }

  # rubocop:disable Lint/ConstantDefinitionInBlock
  class TestListener
    def self.event(_data)
    end
  end

  class TestPublisher
    include Wisper::Publisher

    def run(data)
      broadcast(:event, data)
    end
  end
  # rubocop:enable Lint/ConstantDefinitionInBlock

  let(:queue) { 'whatever' }
  let(:publisher) { TestPublisher.new }

  before do
    publisher.subscribe(TestListener, async: broadcaster)
  end

  it 'sends event' do
    expect(TestListener).to receive(:event).with(42)
    publisher.run(42)
  end

  it 'uses specified queue' do
    expect(Wisper::AsyncBroadcaster::Wrapper).to receive(:set).with(queue: queue).and_call_original
    publisher.run(42)
  end
end
