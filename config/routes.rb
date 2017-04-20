Rails.application.routes.draw do
  resources :offers
  resources :buyers
  resources :listings, only: :index
  resources :vendors do
    resources :listings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "listings#index"
end
