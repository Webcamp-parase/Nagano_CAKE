class Category < ApplicationRecord
	enum status: { 有効: true, 無効: false }

	has_many :products, dependent: :destroy
end
