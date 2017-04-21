Rails.application.routes.draw do
  devise_for :users

  resources :actors do
    get '/reviews/new', to: 'reviews#actor_new'
    post '/reviews', to: 'reviews#actor_create'
  end


  resources :films do
    get '/reviews/new', to: 'reviews#film_new'
    post '/reviews', to: 'reviews#film_create'
    get '/ratings/new', to: 'ratings#new_film_rating'
    post '/ratings', to: 'ratings#create_film_rating'
  end

  resources :reviews, except: [:new, :create] do
    get '/ratings/new', to: 'ratings#new_review_rating'
    post '/ratings', to: 'ratings#create_review_rating'
  end

  resources :ratings, except: [:new, :create]
  resources :categories

  root "films#index"
end
