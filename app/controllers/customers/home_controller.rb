class Customers::HomeController < ApplicationController
  def top
  	@categories = Category.all
  	@products = Product.find(OrderProduct.group(:product_id).order('count(order_id) desc').limit(4).pluck(:product_id))
  end
end
