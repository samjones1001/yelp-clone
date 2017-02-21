Rails.application.routes.draw do
  devise_for :users
  root "restaurants#index"
  resources :restaurants do
    resources :reviews
  end
  get 'restaurants' => 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
