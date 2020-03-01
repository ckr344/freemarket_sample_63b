class ProductsController < ApplicationController
  before_action :authenticate_user!, except:[:index]

  def index
    
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to root_path
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :status, :delivery_charge, :delivery_method, :delivery_prefecture, :delivery_days, :size, :brand, :price, :transaction_id, :main_category_id, :second_category_id, :third_category_id).merge(user_id: current_user.id)
  end

end
