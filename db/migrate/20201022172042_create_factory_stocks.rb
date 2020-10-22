class CreateFactoryStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :factory_stocks, &:timestamps

    add_reference :cars, :factory_stock, foreign_key: true
  end
end
