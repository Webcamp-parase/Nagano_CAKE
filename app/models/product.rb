class Product < ApplicationRecord
	attachment :image
	enum status: { 販売中: true, 売切れ: false }

	validates :name, presence: true
	validates :description, presence: true
	validates :category_id, presence: true
	validates :non_tax_price, presence: true
	validates :image, presence: true
	validates :status, presence: true

	belongs_to :category
	has_many :cart_items, dependent: :destroy
	has_many :order_products, dependent: :destroy




	def self.search(keyword)
		where("name like?", "%#{keyword}%")
	end

end
