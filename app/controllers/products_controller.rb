class ProductsController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  before_action :parentCategory

  def index
    @categories = Category.all.order("id ASC").limit(13)
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render 'new'
    end    
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
    params.require(:product).permit(:name, :description, :status, :delivery_charge, :delivery_method, :delivery_prefecture, :delivery_days, :size, :brand, :price, :transaction_id, :main_category_id, :second_category_id, :third_category_id,
      images_attributes: {image: []}).merge(user_id: current_user.id)
  end

end