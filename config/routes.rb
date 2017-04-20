Rails.application.routes.draw do
  devise_for :users


  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'
  # }

  resources :films do
    get '/reviews/new', to: 'reviews#film_new'
  end

  resources :reviews, only: [:show, :edit, :update, :destroy]


  root "films#index"
end
