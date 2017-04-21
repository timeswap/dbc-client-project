Rails.application.routes.draw do
  devise_for :users
  resources :films
  resources :categories
  root "films#index"
end
