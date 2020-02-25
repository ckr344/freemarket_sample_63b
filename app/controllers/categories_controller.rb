class CategoriesController < ApplicationController
  def index 
  @categories = Category.all.order("id ASC").limit(13)
  end
end
