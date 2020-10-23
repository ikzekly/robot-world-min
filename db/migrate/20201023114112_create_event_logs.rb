class CreateEventLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :event_logs do |t|
      t.belongs_to :order, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
