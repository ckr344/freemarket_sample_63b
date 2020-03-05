class ProductsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    
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
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.user_id == current_user.id
      @product.update(product_params)
      redirect_to product_path
    else
      render 'edit'
    end
  end

  def destroy
    # 保留です
    # if product.user_id == current_user.id
    #   @product.destroy
    #   redirect_to root_path
    # else
    #   render 'show'
    # end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :status, :delivery_charge, :delivery_method, :delivery_prefecture, :delivery_days, :size, :brand, :price, :transaction_id, :main_category_id, :second_category_id, :third_category_id,
      images_attributes: {image: []}).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_user
    @user = User.find(@product.user_id)
  end

end