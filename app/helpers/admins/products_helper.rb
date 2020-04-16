module Admins::ProductsHelper

	def addTax(non_tax_price)
		taxed_price = (BigDecimal(non_tax_price) * BigDecimal("1.1")).ceil
		"#{taxed_price.to_s(:delimited)}"
	end
end
