class CartItem < ApplicationRecord
	belongs_to :products, dependent: :destroy
	belongs_to :customer
end
