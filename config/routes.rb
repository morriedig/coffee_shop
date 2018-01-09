Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shops, only: [:index, :show]

  namespace :admin do
    resources :shops
    resources :positions, only: [:create, :destroy]

    root "shop#index"
  end


  root "shop#index"

end
