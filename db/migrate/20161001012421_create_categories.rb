class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name_Category, null: false

      t.timestamps
    end
  end
end
