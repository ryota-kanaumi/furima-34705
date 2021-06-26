class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :product_find, only: [:index, :create]
  before_action :move_to_index,  only: [:index, :create]
  before_action :no_purchase , only: [:index, :create]
  

  def index 
    @order = Order.new
  end
  
  def create
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

  def product_find
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    if @product.user.id == current_user.id
     redirect_to root_path
    end
  end

  def no_purchase
    if @product.purchase_record != nil
     redirect_to root_path
    end
  end

end
