class Product < ApplicationRecord
	attachment :image
	enum status: { 販売中: true, 売切れ: false }

	belongs_to :category
	has_many :cart_items, dependent: :destroy
	has_many :order_products, dependent: :destroy

	def self.search(keyword)
		where("name like?", "%#{keyword}%")
	end
end
