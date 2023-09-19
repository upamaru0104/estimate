Rails.application.routes.draw do
  devise_for :users
  get 'estimates/index'
  root to: "estimates#index"
  resources :estimates
  get '/estimate/:id', to: 'estimates#search'
  resources :users, only: :show
end
