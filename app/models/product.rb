class Product < ApplicationRecord
	attachment :image
	enum status: { 販売中: true, 売切れ: false }

	belongs_to :category
	has_many :cart_items, dependent: :destroy
end
