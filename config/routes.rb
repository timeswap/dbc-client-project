Rails.application.routes.draw do
  devise_for :users

  resources :actors do
    get '/reviews/new', to: 'reviews#actor_new'
    post '/reviews', to: 'reviews#actor_create'
  end

  resources :films do
    get '/reviews/new', to: 'reviews#film_new'
    post '/reviews', to: 'reviews#film_create'
  end

  resources :reviews, except: [:new, :create]
  resources :categories

  root "films#index"
end
