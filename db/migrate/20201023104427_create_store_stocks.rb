class CreateStoreStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :store_stocks, &:timestamps

    add_reference :cars, :store_stock, foreign_key: true
  end
end
