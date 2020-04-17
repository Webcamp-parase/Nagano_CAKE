class Customers::ProductsController < ApplicationController
  def index
  	@categories = Category.all
  	@products = Product.page(params[:page]).reverse_order
  	if params[:category_id]
  		@category = Category.find(params[:category_id])
  		@products = @category.products.order(created_at: :desc).page(params[:page]).reverse_order
  	else
  		@products = Product.order(created_at: :desc).page(params[:page]).reverse_order
  	end
  end

  def show
  	@categories = Category.all
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
  end

end
