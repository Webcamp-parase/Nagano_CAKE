class Customers::CartItemsController < ApplicationController
  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.where(customer_id:current_customer.id)
    @total_price = 0
    @cart_items.each do |cart_item|
     #@total_price = @total_price + cart_item.quantity * cart_item.product.non_tax_price
      @total_price += cart_item.quantity * cart_item.product.non_tax_price
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.where(customer_id:current_customer.id).destroy_all
    redirect_to cart_items_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
    end
end
