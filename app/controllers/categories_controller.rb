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
    @category = Category.find(params[:id])
    @category_products = Product.where(category_id: @category.id)
  end

end
