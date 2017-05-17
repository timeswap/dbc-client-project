class FilmsController < ApplicationController
  def index
    @films = Film.order(:title).page params[:page]

	  if params[:search]
	    @films = Film.search(params[:search]).order("title DESC").page
	  else
	    @films = Film.all.order("created_at DESC").page
	  end

  end

  def show
    authenticate_user!
    @film = Film.find(params[:id])
  end

end
