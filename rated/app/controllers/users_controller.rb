class UsersController < ApplicationController
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  #   To verify if a user is signed in, use the following helper:
  # user_signed_in?

  # For the current signed-in user, this helper is available:
  # current_user

  # You can access the session for this scope:
  # user_session

end
