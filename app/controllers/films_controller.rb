class FilmsController < ApplicationController
  def index
    # @films = Film.all
    @films = Film.order(:title).page params[:page]
    @search = Film.ransack(params[:q])
  	@film = @search.result(distinct: true)

  	@allfilms = Film.all
	  if params[:search]
	    @allfilms = Film.search(params[:search]).order("title DESC")
	  else
	    @allfilms = Film.all.order("created_at DESC")
	  end

  end

  def show
    authenticate_user!
    @film = Film.find(params[:id])
  end

end
