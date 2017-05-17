class FilmsController < ApplicationController
  def index
    # @films = Film.all
    @films = Film.order(:title).page params[:page]
    @search = Film.ransack(params[:q])
  	@film = @search.result(distinct: true)
  end

  def show
    authenticate_user!
    @film = Film.find(params[:id])
  end

end
