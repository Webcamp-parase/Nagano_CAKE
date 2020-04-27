class Customers::ProductsController < ApplicationController
  def index
  	@categories = Category.where(status: "有効")
  	if params[:category_id]
  		@category = Category.find(params[:category_id])
  		@products = @category.products.order(created_at: :desc).page(params[:page]).per(8)
      @name = @category.name
  	else
  		@products = Product.where(category_id: @categories).order(created_at: :desc).page(params[:page]).per(8)
      @name = "商品"
  	end
  end

  def show
  	@categories = Category.where(status: "有効")
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
    if @product.category.status == "無効"
      redirect_to products_path
    end
  end

end
