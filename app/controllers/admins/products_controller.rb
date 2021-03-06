class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_product_path(@product.id)
    else
      render "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admins_product_path(params[:id])
    else
      render "edit"
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :non_tax_price, :image, :status)
  end

end
