class Customers::OrdersController < ApplicationController
  def input
    @order = Order.new
  end

  def confirm
    @items = CartItem.where(customer_id:current_customer.id)
    @payment_method = order_params[:payment_method]
    @order = Order.new

    if order_params[:delivery_select] == "1"
      @postal_code = current_customer.postal_code
      @address = current_customer.address
      @name = "#{current_customer.last_name}#{current_customer.first_name}"
    elsif order_params[:delivery_select] == "2"
      @delivery = Delivery.find_by(customer_id: current_customer.id, id: order_params[:delivery_id])
      @postal_code = @delivery.postal_code
      @address = @delivery.address
      @name = @delivery.name
    else
      @postal_code = order_params[:postal_code]
      @address = order_params[:address]
      @name = order_params[:name]
    end

    @total_price = 0
    @items.each do |item|
     #@total_price = @total_price + cart_item.quantity * cart_item.product.non_tax_price
      @total_price += (item.quantity * item.product.non_tax_price * 1.1)
    end

  end

  def complete
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order.id)
  end

  def create
    @order = Order.new(order_params)
    @order.save

    @items = CartItem.where(customer_id: current_customer.id)
    @items.each do |item|
      @order_product = OrderProduct.new
      @order_product.product_id = item.product_id
      @order_product.quantity = item.quantity
      @order_product.price = item.product.non_tax_price
      @order_product.order_id = @order.id
      @order_product.save
      item.destroy
    end

    redirect_to order_complete_path
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_fee, :payment_method, :name, :postal_code, :address, :status, :delivery_select, :delivery_id)
  end

end
