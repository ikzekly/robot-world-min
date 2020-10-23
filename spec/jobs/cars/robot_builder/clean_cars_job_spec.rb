# frozen_string_literal: true

RSpec.describe Cars::RobotBuilder::CleanCarsJob do
  subject(:job) { described_class.new }

  before do
    car_model = create(:car_model)

    create_list(:car, 10, car_model: car_model)
  end

  describe '#perform' do
    it { expect { job.perform }.to change { Car.count }.from(10).to(0) }
  end
end
