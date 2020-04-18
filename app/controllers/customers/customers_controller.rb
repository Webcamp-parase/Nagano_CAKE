class Customers::CustomersController < ApplicationController
  def show
  	@customer = Customer.find(current_customer.id)
  end

  def edit
  	@customer = Customer.find(current_customer.id)
  end

  def update
  	@customer = Customer.find(current_customer.id)
  	if @customer.update(customer_params)
  		redirect_to customers_path
  	else
  		render "edit"
  	end
  end

  def retire

  end

  def retire_update
    customer = Customer.find(current_customer.id)
    customer.update(status: false)
  end

  private

  def customer_params
  	params.require(:customer).permit(:last_name, :first_name, :read_last_name, :read_first_name, :postal_code, :address, :phone_number)
  end
end