# frozen_string_literal: true

RSpec.describe EventLog, type: :model do
  let(:event_log) { build(:event_log) }

  describe 'valid?' do
    it { expect(event_log).to be_valid }
  end

  context 'associations' do
    it { expect(event_log).to respond_to(:order) }
  end
end
