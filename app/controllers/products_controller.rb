class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    unless user_signed_in?
      redirect_to root_path
    end
    @product = Product.create(product_params)
    @product.save
    if @product.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    unless @product.user == current_user
      redirect_to root_path
    end
  end

  def show
    @product = Prototype.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :product_description, :category_id, :product_condition_id, 
      :delivery_charge_id, :shipping_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  
end
