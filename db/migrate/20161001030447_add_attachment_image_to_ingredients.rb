class AddAttachmentImageToIngredients < ActiveRecord::Migration
  def self.up
    change_table :ingredients do |t|
      t.attachment :image
       t.attachment :imageno
    end
  end

  def self.down
    remove_attachment :ingredients, :image
    remove_attachment :ingredients, :imageno
  end
end
