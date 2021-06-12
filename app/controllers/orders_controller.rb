class OrdersController < ApplicationController

  def index 
    @product = Product.find(params[:product_id])
  end

  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
   def order_params
     params.permit(:token, :postal_code, :prefecture_id, :municipality, :address, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
   end
end
