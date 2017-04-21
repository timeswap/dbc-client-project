class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    authenticate_user!
    @film = Film.find(params[:id])
  end

end
