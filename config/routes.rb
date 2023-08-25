Rails.application.routes.draw do
  get 'estimates/index'
  root to: "estimates#index"
end
