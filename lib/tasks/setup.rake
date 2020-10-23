# frozen_string_literal: true

namespace :setup do
  task car_models: :environment do
    time = Time.current

    car_models_data = CarModel::NAMES.inject([]) do |data_array, name|
      data_array << { name: name, created_at: time, updated_at: time }
    end

    CarModel.insert_all(car_models_data, unique_by: :index_car_models_on_name)
  end
end
