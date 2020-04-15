Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  scope module: :customers do
  	resources :customers, only: [:show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
