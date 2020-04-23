class Admins::CustomersController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@customers = Customer.all.page(params[:page]).per(10)
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	@customer.update(customer_params)
  	redirect_to admins_customer_path(params[:id])
  end

  private

   	def customer_params
       	params.require(:customer).permit(:last_name, :first_name, :read_last_name, :read_first_name, :postal_code, :address, :phone_number, :email, :status)
  	end

end
