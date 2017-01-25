class Order < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :hour, presence: true
  validates :quantity, presence: true
  validates :tamaño, presence: true
  validates :tipo, presence: true

  attr_accessor :ingredients, :pan, :queso
  validates :ingredients, presence: true
  validates :pan, presence: true
  validates :queso, presence: true


  after_create :save_ingredients

  def ingredients=(value)
  	@ingredients = value
  end

  def pan=(value)
    @pan = value
  end

  def queso=(value)
    @queso = value
  end


  def save_ingredients
  unless @ingredients.nil?
  	@ingredients.each do |ingrediente_id|
      precio = Ingredient.find(ingrediente_id).Price
  		OrderDetail.create(order_id: self.id, ingredient_id: ingrediente_id, price: precio)
  		#toca corregir price al precio where id_ingrediente = self.id
  	end
  end
    OrderDetail.create(order_id: self.id, ingredient_id: @pan, price: 0)
    OrderDetail.create(order_id: self.id, ingredient_id: @queso, price: 0)
    OrderDetail.create(order_id: self.id, ingredient_id: Order.find(self.id).tipo, price: 0)

    compra = Order.find(self.id)
    User.find(compra.user_id).update(saldo: (User.find(compra.user_id).saldo - compra.total))
  end
  
end
