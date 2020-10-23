# frozen_string_literal: true

RSpec.describe RobotGuard::CarsListener do
  subject(:listener) { described_class }

  describe '.defected' do
    context 'with defected car' do
      let(:car) { create(:car, :defected) }

      it 'sends notification' do
        expect(Cars::SlackNotifier).to receive(:call)

        listener.defected(car.id)
      end

      context 'with completed car' do
        let(:car) { create(:car, :completed) }

        it "doesn't sends notification" do
          expect(Cars::SlackNotifier).not_to receive(:call)

          listener.defected(car.id)
        end
      end
    end
  end
end
