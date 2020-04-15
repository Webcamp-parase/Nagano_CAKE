class Admins::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admins_products_path
  end

  def update
  end

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :non_tax_price, :image_id, :status)
  end

end
