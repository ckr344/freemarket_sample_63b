class CategoriesController < ApplicationController
  def index 
  @categories = Category.all.order("id ASC").limit(13)
  end
  def show

  end
end
