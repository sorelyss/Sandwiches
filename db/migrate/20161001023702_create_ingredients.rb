class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.references :category, foreign_key: true, null: false
      t.string :name_Ingredient, null: false
      t.integer :Price, null: false
      t.text :Description

      t.timestamps
    end
  end
end
