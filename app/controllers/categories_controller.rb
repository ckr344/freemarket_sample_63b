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

end
