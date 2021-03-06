class ProductsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    # 検索機能
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @categories = Category.all.order("id ASC").limit(13)
    # カテゴリー別 一覧表示
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
    @search_products = @q.result(distinct: true)
    @categories = Category.order("id ASC").limit(13)
  end

  def new
    @product = Product.new
    @image = @product.images.build
    @category = Category.all.order("id ASC").limit(13)
    #セレクトボックスの初期値設定
    @category_parent_array = ["選択してください"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        redirect_to product_path(@product.id)
      else
        @product.images.build
        redirect_to new_product_path
      end
  end

  def show
    @top_image = @product.images.first
    @images = @product.images
    # SOLD OUT確認用
    @transaction_check = Transaction.where(product_id: @product.id)
  end

  def edit
    @category = Category.order("id ASC").limit(13)
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
    @product = Product.find(params[:id])
      if @product.update(product_update_params)
        redirect_to product_path(@product.id)
      else
        redirect_to edit_product
      end
  end

  def category_children 
    @category_children = Category.find_by(name: "#{params[:name]}", ancestry: nil).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:name]}").children
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
    params.require(:product).permit(
      :name, :description, :status, :delivery_charge, :delivery_method, :delivery_prefecture, :delivery_days, :size, :brand, :price, :transaction_id, :category_id,
      [images_attributes: [:image]]).merge(user_id: current_user.id)
  end

  def product_update_params
    params.require(:product).permit(
      :name, :description, :status, :delivery_charge, :delivery_method, :delivery_prefecture, :delivery_days, :size, :brand, :price, :transaction_id, :category_id,
      [images_attributes: [:image, :_destroy, :id]]).merge(user_id: current_user.id)
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