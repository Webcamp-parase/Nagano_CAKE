class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all.order(created_at: "DESC").page(params[:page]).per(10)
  end

  def show
  	@order = Order.find(params[:id])
  	@total_price = 0
  	@order.order_products.each do |order_product|
  		@total_price += order_product.price * order_product.quantity
  	end
  end

  def update
  	order = Order.find(params[:id])
  	order.update(order_params)
  	if order_params[:status] == "入金確認"
  		order.order_products.update_all(status: "製作待ち")
  	end
  	redirect_to admins_order_path(order)
  end

  private

  def order_params
  	params.require(:order).permit(:status)
  end
end
