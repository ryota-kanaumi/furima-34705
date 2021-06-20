class OrdersController < ApplicationController
  before_action :move_to_index, :no_purchase

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
    redirect_to new_user_session_path unless user_signed_in?
    @product = Product.find(params[:product_id])
    if @product.user.id == current_user.id
      redirect_to root_path 
    end
  end

  def no_purchase
    if @product.purchase_record
     redirect_to root_path
    end
  end

end
