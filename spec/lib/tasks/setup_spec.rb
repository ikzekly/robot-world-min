# frozen_string_literal: true

require 'rake'

RSpec.describe 'setup' do
  before do
    Rake.application.rake_require("tasks/#{task_name.split(':').first}")
    Rake::Task.define_task(:environment)
  end

  let(:rake_task) do
    lambda do |task_name|
      Rake::Task[task_name].reenable
      Rake.application.invoke_task(task_name)
    end
  end

  describe 'setup:car_models' do
    let(:task_name) { 'setup:car_models' }

    it 'creates car models' do
      expect { rake_task.call(task_name) }.to change { CarModel.count }.from(0).to(CarModel::NAMES.count)
    end
  end
end
