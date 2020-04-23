Rails.application.routes.draw do

  root 'customers/home#top'
  devise_for :admins
  devise_for :customers

  scope module: :customers do
  	resource :customers, only: [:show]
  	get "customers/customers_edit" => "customers#edit", as: "edit_customers"
  	patch "customers/update"
  	get "customers/retire"
  	patch "customers/retire" => "customers#retire_update"

  	resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
    resources :products, only: [:index, :show, :new, :create, :edit, :update]
    delete "cart_items" => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :create, :update, :destroy]

    get "order/input" => "orders#input"
    resources :orders, only: [:index, :show, :create] do
      collection do
        post :confirm
      end
    end
    get "order/complete" => "orders#complete"
    resource :order_products, only: [:create]

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do
    resources :categories, only: [:index, :create, :edit, :update]
    resources :products, only: [:index, :show, :new, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_products, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    get "home/top" => "home#top"
  end


end
