Rails.application.routes.draw do
  resources :buyers do
    resources :offers
  end
  resources :listings, only: :index
  resources :vendors do
    resources :listings do
      resources :offers, only: [:index, :show]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'listings#index'
end
