class Customers::SearchController < ApplicationController
	def search
		@categories = Category.where(status: "有効")
		@products = Product.where(category_id: @categories).search(params[:keyword]).page(params[:page]).per(8)
	end
end
