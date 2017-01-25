class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_order_detail, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    @ingredients = Ingredient.order(:category_id).all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @ingredients = Ingredient.order(:category_id).all
  end

  # GET /orders/1/edit
  def edit
  end

  def opcion
    @sizeSelected = params['myform']['opc']
    render 'orders/_tipos', sizeSelect: @sizeSelected
    
  end

  def PrimeraEtapa
    orden = Order.new
    @ingredients = Ingredient.order(:category_id).all
    begin
      @tipo = params['myform']['tipo']
      render 'orders/_form', :locals => {:order => orden, :tipo => @tipo}
    rescue Exception => e
      redirect_to new_order_path, alert: 'Ha ocurrido un error al guardar tu compra. Intenta de nuevo.'
    end

  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.ingredients = params[:ingredients]
    @order.pan = params[:panSelected]
    @order.queso = params[:quesoSelected]
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Su orden fue creada correctamente.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to new_order_path, alert: 'Ha ocurrido un error al guardar tu compra. Intenta de nuevo.' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])

      rescue ActiveRecord::RecordNotFound
         redirect_to new_order_path, alert: 'Ha ocurrido un error al guardar tu compra. Intenta de nuevo.'
    end

    def set_order_detail
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:created_at, :hour, :comments, :user_id, :quantity, :total, :tipo, :tamaño, :ingredients, :panSelected, :quesoSelected)
    end

end
