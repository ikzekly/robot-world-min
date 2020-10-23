class AddIndexToCarModelByName < ActiveRecord::Migration[6.0]
  def change
    add_index :car_models, :name, unique: true
  end
end
