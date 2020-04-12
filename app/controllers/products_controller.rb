class ProductsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @categories = Category.all.order("id ASC").limit(13)
    @ladies_products = Product.where(category_id: 20..85).limit(10)
    @mens_products = Product.where(category_id: 91..144).limit(10)
    @appliances_products = Product.where(category_id: 408..434).limit(10)
    # カテゴリー別 Sold Out Check
    @ladies_transaction = Transaction.where(product_id: @ladies_products.ids)
    @mens_transaction = Transaction.where(product_id: @mens_products.ids)
    @appliances_transaction = Transaction.where(product_id: @appliances_products.ids)
  end
  def search
    @q = Product.search(search_params)
    @products = @q.result(distinct: true)
    @categories = Category.all.order("id ASC").limit(13)
  end
  def new
    @product = Product.new
    @image = @product.images.build
    @category = Category.all.order("id ASC").limit(13)
  end
  def create
    @product = Product.new(product_params)
    @category = Category.all.order("id ASC").limit(13)
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
    # SOLD OUT確認用
    @transaction_check = Transaction.where(product_id: @product.id)
  end
  def edit
    @product = Product.find(params[:id]).presence || "商品は存在しません"
    # 親セレクトボックスの初期値(配列)
    @category_parent_array = []
    # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    # itemに紐づいていいる孫カテゴリーの親である子カテゴリが属している子カテゴリーの一覧を配列で取得
    @category_child_array = @product.category.parent.parent.children
    # itemに紐づいていいる孫カテゴリーが属している孫カテゴリーの一覧を配列で取得
    @category_grandchild_array = @product.category.parent.children
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
  def category_children 
    # @category_children = Category.find(params[:productCategory]).children
    @category_children = Category.find_by(params[:name]).children
  end
  def category_grandchildren
    # @category_grandchildren = Category.find(params[:productCategory]).children
    @category_grandchildren = Category.find_by(params[:name]).children
  end
  # def category_children_update
  #   # @category_children = Category.find(params[:productCategory]).children 
  #   @category_children = Category.find_by(params[:productCategory]).children 
  # end
  # def category_grandchildren_update
  #   # @category_grandchildren = Category.find(params[:productCategory]).children
  #   @category_grandchildren = Category.find_by(params[:productCategory]).children
  # end
  private
  def product_params
    params.require(:product).permit(:name, :description, :status, :delivery_charge, :delivery_method, :delivery_prefecture, :delivery_days, :size, :brand, :price, :transaction_id, :category_id,
      images_attributes: [:name]).merge(user_id: current_user.id)
  end
  def set_product
    @product = Product.find(params[:id])
  end
  def set_user
    @user = User.find(@product.user_id)
  end
  def search_params
    params.require(:q).permit(:name_cont)
  end
end