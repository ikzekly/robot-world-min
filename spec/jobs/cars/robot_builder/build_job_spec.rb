# frozen_string_literal: true

RSpec.describe Cars::RobotBuilder::BuildJob do
  subject(:job) { described_class.new }

  before do
    create(:car_model)
  end

  describe '#perform' do
    it { expect { job.perform }.to change { Car.count }.from(0).to(10) }
  end
end
