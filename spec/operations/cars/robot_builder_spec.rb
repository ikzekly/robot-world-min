# frozen_string_literal: true

RSpec.describe Operations::Cars::RobotBuilder do
  subject(:operation) { described_class.new(car) }

  before do
    create(:car_model)

    allow(Cars::DefectsProbability).to receive(:build).and_return(
      OpenStruct.new(defect_found?: defect_found, defected_part: 'wheels')
    )
  end

  describe '#call' do
    let(:defect_found) { false }

    context 'with new car' do
      let(:car) { Car.new }

      it 'builds basics' do
        operation.call

        expect(car).to be_basic_structure
      end
    end

    context 'with basic builded car' do
      let(:car) { build(:car, :basic_structure) }

      it 'builds electrics' do
        operation.call

        expect(car).to be_electronic_devices
      end
    end

    context 'with electronic builded car' do
      let(:car) { build(:car, :basic_structure, :electronic_devices) }

      it 'builds painting and finals' do
        operation.call

        expect(car).to be_painting_and_final_details
      end
    end

    context 'with painting and final car' do
      let(:car) { build(:car, :basic_structure, :electronic_devices, :painting_and_final_details) }

      it 'builds complete' do
        operation.call

        expect(car).to be_completed
      end

      it 'broandcasts completed event' do
        expect { operation.call }.to broadcast(:completed, car.id)
      end

      context 'with defects' do
        let(:defect_found) { true }

        it 'builds defected' do
          operation.call

          expect(car).to be_defected
        end
      end
    end
  end
end
