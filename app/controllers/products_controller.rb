class ProductsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @categories = Category.all.order("id ASC").limit(13)
  end

  def new
    @product = Product.new
    @image = @product.images.build
  end

  def create
    @product = Product.new(product_params)
      if @product.save
          params[:images]["image"].each do |image|
            @image = @product.images.create!(image: image)
          end
        redirect_to root_path
      else
        @product.images.build
        render action: 'new'
      end
  end

  def show
    @top_image = @product.images.first
    @images = @product.images
  end

  def edit
    @product = current_user.products.find(params[:id]).presence || "商品は存在しません"
  end

  def update
    @product = current_user.products.find(params[:id]).presence || "商品は存在しません"
    
    if @product.update(product_params)
      redirect_to product_path
    else
      render 'edit'
    end  
  end

  def destroy
    @product = current_user.products.find(params[:id])
    if @product.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private
  
  def product_params
    params.require(:product).permit(:name, :description, :status, :delivery_charge, :delivery_method, :delivery_prefecture, :delivery_days, :size, :brand, :price, :transaction_id, :main_category_id, :second_category_id, :third_category_id,
      images_attributes: [:name]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_user
    @user = User.find(@product.user_id)
  end

end