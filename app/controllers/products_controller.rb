class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @product = Product.new
  end

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def create
     @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :product_description, :category_id, :product_condition_id, 
      :delivery_charge_id, :shipping_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  
end
