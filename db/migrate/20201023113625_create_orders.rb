class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :car_model, index: true, foreign_key: true, null: false
      t.belongs_to :car, index: true, foreign_key: true

      t.timestamps
    end
  end
end
