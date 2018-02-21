Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shops, only: [:index, :show]
  resources :shop_cities, only: [:show]

  namespace :admin do
    resources :shops
    resources :positions, only: [:create, :destroy]

    root "shops#index"
  end


  root "shops#index"

end
