class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.references :order, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
