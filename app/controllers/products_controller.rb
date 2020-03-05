class ProductsController < ApplicationController

  def index
    @categories = Category.all.order("id ASC").limit(13)
  end

  def new
    @product = Product.new
  end

  def create
    
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

end
