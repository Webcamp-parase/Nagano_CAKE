class Admins::OrderProductsController < ApplicationController
	def update
		order_product = OrderProduct.find(params[:id])
		order = order_product.order

		order_product.update(order_product_params)
		if order_product_params[:status] == "製作中" && order_product.order.status != "製作中"
			order_product.order.update(status: "製作中")
			redirect_to admins_order_path(order)
		elsif order.order_products.where(status: "製作完了").count == order.order_products.count
			order.update(status: "発送準備中")
			redirect_to admins_order_path(order)
		else
			redirect_to admins_order_path(order)
		end
	end

	private

	def order_product_params
		params.require(:order_product).permit(:status)
	end
end
