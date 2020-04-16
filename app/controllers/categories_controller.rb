class CategoriesController < ApplicationController
  
  def index
  
  end
  
  def new
    @children = Category.where(ancestry: params[:parent_id])
    respond_to do |format|
      format.html
      format.json{render json: @children}
    end
  end

  def show
    # @category_name = Category.find(params[:id]).name
    # # 表示する商品を格納する配列を宣言
    # @display_products = []
    # # selling_status = 0（出品中）の商品を全て取得
    # items = Item.where("selling_status = 0")
    # # カテゴリーidをinteger型にキャストして変数に格納しておく
    # category_id = (params[:id]).to_i
    # # 出品中の全商品の中から自身または親のカテゴリーidがcategory_idと一致するものを@display_itemsに格納する。
    # items.each do |item|
    #   if item.category.id == category_id || item.category.ancestor_ids.include?(category_id)
    #     @display_items << item
    #   end
    # end

    @category = Category.find(params[:id])
    @category_products = Product.where(category_id: @category.id)

  end

end
