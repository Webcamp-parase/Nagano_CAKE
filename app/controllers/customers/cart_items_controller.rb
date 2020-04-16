class Customers::CartItemsController < ApplicationController
  def create
    @cart_items = CartItems.new
  end

  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:quantity)
    end
end
