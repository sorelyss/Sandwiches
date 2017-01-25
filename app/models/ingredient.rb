class Ingredient < ApplicationRecord
  belongs_to :category
  has_attached_file :image, styles: {medium: "80x80#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
   has_attached_file :imageno, styles: {medium: "80x80#"}
  validates_attachment_content_type :imageno, content_type: /\Aimage\/.*\z/
end
