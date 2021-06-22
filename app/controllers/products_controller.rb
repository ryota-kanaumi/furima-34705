class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :product, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @product.update(product_params)
       redirect_to root_path
    else 
       render action: :edit
    end
  end


  def destroy
    if @product.destroy(product_params)
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :product_description, :category_id, :product_condition_id, 
      :delivery_charge_id, :shipping_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def product
    @product = Product.find(params[:id])
  end

  def user_check
    unless @product.user == current_user
      redirect_to root_path
    end
  end


end
