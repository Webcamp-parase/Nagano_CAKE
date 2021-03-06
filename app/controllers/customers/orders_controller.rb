class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def input
    @order = Order.new
    @postal_code_error = ""
    @address_error = ""
    @name_error = ""
  end

  def confirm
    @items = CartItem.where(customer_id:current_customer.id)
    @payment_method = order_params[:payment_method]
    @order = Order.new
    @delivery = Delivery.new
    @delivery_select = select_params[:delivery_select]

    if select_params[:delivery_select] == "1"
      @postal_code = current_customer.postal_code
      @address = current_customer.address
      @name = "#{current_customer.last_name}#{current_customer.first_name}"
    elsif select_params[:delivery_select] == "2"
      @delivery = Delivery.find_by(customer_id: current_customer.id, id: select_params[:delivery_id])
      @postal_code = @delivery.postal_code
      @address = @delivery.address
      @name = @delivery.name
    else
      if select_params[:postal_code] == "" || select_params[:address] == "" || select_params[:name] == ""
        if select_params[:postal_code] == ""
          @postal_code_error = "郵便番号を入力してください"
        end
        if select_params[:address] == ""
          @address_error = "住所を入力してください"
        end
        if select_params[:name] == ""
          @name_error = "宛名を入力してください"
        end
        render "input"
      else
        @postal_code = select_params[:postal_code]
       @address = select_params[:address]
        @name = select_params[:name]
      end
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
    @orders = Order.where(customer_id: current_customer.id).order(created_at: "DESC").page(params[:page]).per(10)
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

      if select_params[:delivery_select] == "3"
        @delivery = Delivery.new(delivery_params)
        @delivery.postal_code = @order.postal_code
        @delivery.address = @order.address
        @delivery.name = @order.name
        @delivery.customer_id = current_customer.id
        @delivery.save!
      end

    redirect_to order_complete_path
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_fee, :payment_method, :name, :postal_code, :address, :status)
  end

  def select_params
    params.require(:order).permit(:delivery_select, :delivery_id, :postal_code, :address, :name)
  end

  def delivery_params
    params.require(:order).permit(:postal_code, :address, :name, :customer_id)
  end

end
