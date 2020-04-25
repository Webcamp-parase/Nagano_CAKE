class Admins::SearchController < ApplicationController
	def search
		if params[:method] == "customer"
			@customers = Customer.search(params[:keyword]).page(params[:page]).per(10)
		else
			@products = Product.search(params[:keyword]).page(params[:page]).per(10)
		end
	end
end
