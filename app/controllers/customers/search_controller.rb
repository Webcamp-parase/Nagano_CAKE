class Customers::SearchController < ApplicationController
	def search
		@products = Product.search(params[:keyword]).page(params[:page]).per(8)
		@categories = Category.all
	end
end
