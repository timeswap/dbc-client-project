Rails.application.routes.draw do
  devise_for :users


  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'
  # }

  resources :actors do
    get '/reviews/new', to: 'reviews#actor_new'
    post '/reviews', to: 'reviews#actor_create'
  end

  resources :films do
    get '/reviews/new', to: 'reviews#film_new'
    post '/reviews', to: 'reviews#film_create'
    get '/comments/new', to: 'comments#film_new'
    post '/comments', to: 'comments#film_create'

  end

  resources :reviews, except: [:new, :create] do
    get '/comments/new', to: 'comments#review_new'
    post '/comments', to: 'comments#review_create'
  end

  resources :categories

  resources :comments, only: [:destroy]

  root "films#index"
end
