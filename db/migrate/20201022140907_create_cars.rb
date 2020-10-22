class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :state, null: false, default: :new

      t.integer :year, null: false, limit: 2

      t.integer :wheels, limit: 2
      t.integer :chassis, limit: 2
      t.integer :laser, limit: 2
      t.integer :computer, limit: 2
      t.integer :engine, limit: 2

      t.decimal :price, precision: 8, scale: 2, default: 0.0
      t.decimal :cost_price, precision: 8, scale: 2, default: 0.0

      t.boolean :checked, null: false, default: false

      t.timestamps
    end
  end
end
