class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable, :rememberable, 
         :trackable, :validatable, :confirmable

  validates :name, presence: true
  validates :codigo, presence: true
  validates :codigo, uniqueness: true, if: -> { self.codigo.present? }
end
