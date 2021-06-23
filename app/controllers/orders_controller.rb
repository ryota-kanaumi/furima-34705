class OrdersController < ApplicationController
  before_action :authenticate_user!,:move_to_index, :no_purchase

  def index 
    @product = Product.find(params[:product_id])
    @order = Order.new
  end
  
  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
       @order.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
     params.require(:order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number)
     .merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def move_to_index
    @product = Product.find(params[:product_id])
    
    if @product.user.id == current_user.id
      redirect_to root_path 
    end
  end

  def no_purchase
    unless @product.purchase_record = nil
     redirect_to root_path
    end
  end

end
