class CartItem < ApplicationRecord
	belongs_to:product
	belongs_to:customer

	validates :quantity, presence: true, numericality: {only_integer: true}

end
