class CategoriesController < ApplicationController
  def index 
  @categories = Category.all.order("id ASC").limit(13)
  
end
def new
  @children = Category.where(ancestry: params[:parent_id])
  respond_to do |format|
    format.html
    format.json{render json: @children}
  end
end
end
