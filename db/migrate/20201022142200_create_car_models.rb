class CreateCarModels < ActiveRecord::Migration[6.0]
  def change
    create_table :car_models do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_reference :cars, :car_model, null: false, foreign_key: true
  end
end
