class CategoriesController < ApplicationController
  before_action :parentCategory,onry:[:index]

  def index
  
  end
  
def new
  @children = Category.where(ancestry: params[:parent_id])
  respond_to do |format|
    format.html
    format.json{render json: @children}
  end
end

  private
def parentCategory
  @categories = Category.all.order("id ASC").limit(13)
end

end
