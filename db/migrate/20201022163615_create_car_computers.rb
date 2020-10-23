class CreateCarComputers < ActiveRecord::Migration[6.0]
  def change
    create_table :car_computers do |t|
      t.belongs_to :car, index: true, foreign_key: { on_delete: :cascade }

      t.string :defected_part

      t.timestamps
    end
  end
end
