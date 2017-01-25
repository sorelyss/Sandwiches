class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.date :created_at, default: Time.now
      t.time :hour, null: false
      t.integer :tamaño, null: false
      t.integer :tipo, null: false
      t.text :comments
      t.references :user, foreign_key: true, null: false
      t.integer :quantity, default: 1
      t.integer :total

      t.timestamps
    end
  end
end
