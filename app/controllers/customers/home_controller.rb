class Customers::HomeController < ApplicationController
  def top
  	@categories = Category.all
  	@products = Product.page(params[:page]).per(4)
  	# @all_ranks = Note.find(Like.group(:note_id).order('count(note_id) desc').limit(3).pluck(:note_id))
  end
end