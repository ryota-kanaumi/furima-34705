class OrdersController < ApplicationController

  def index 
    @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def new
    @order = Order.new(order_params)
  end
  
  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    if @order.valid?
       @order.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

   def order_params
     params.require(:order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
   end
end
