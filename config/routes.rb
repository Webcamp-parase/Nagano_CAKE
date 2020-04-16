Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
   #   devise_scope :customers do
	  #    get 'login' => 'devise/sessions#new', as: :new_customer_session
	  #    post 'login' => 'devise/sessions#create', as: :customer_session
	  #    delete 'logout' => 'devise/sessions#destroy', as: :destroy_customer_session
	  #    get 'signup' => 'devise_invitable/registrations#new', as: :new_customer_registration
	  #    post 'signup' => 'devise_invitable/registrations#create', as: :customer_registration
	  #    get 'signup/cancel' => 'devise_invitable/registrations#cancel', as: :cancel_customer_registration
	  #    delete 'customer' => 'devise_invitable/registrations#destroy', as: :destroy_customer_registration
	  #    get 'password' => 'devise/passwords#new', as: :new_customer_password
	  #    post 'password' => 'devise/passwords#create', as: :customer_password
	  #    get 'password/edit' => 'devise/passwords#edit', as: :edit_customer_password
	  #    patch 'password' => 'devise/passwords#update'
	  #    put 'password' => 'devise/passwords#update', as: :update_customer_password
 	 # end

  scope module: :customers do
  	resource :customers, only: [:show]
  	get "customers/customers_edit" => "customers#edit", as: "edit_customers"
  	patch "customers/update"
  	get "customers/retire"
  	patch "customers/retire" => "customers#retire_update"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
