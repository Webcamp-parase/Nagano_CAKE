class Customers::ProductsController < ApplicationController
  def index
  	@categories = Category.all
  	if params[:category_id]
  		@category = Category.find(params[:category_id])
  		@products = @category.products.order(created_at: :desc).page(params[:page]).per(8)
      @name = @category.name
  	else
  		@products = Product.order(created_at: :desc).page(params[:page]).per(8)
      @name = "商品"
  	end
  end

  def show
  	@categories = Category.all
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
  end

end
