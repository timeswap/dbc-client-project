class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def show
    @review = Review.find(params[:id])
  end

  def film_new
    authenticate
    @film = Film.find(params[:film_id])
    @review = @film.reviews.new
  end

  def film_create
    authenticate
    @film = Film.find(params[:film_id])
    @review = @film.reviews.new(review_params)
    if @review.save
      redirect_to @review
    else
      @errors = @review.errors.full_messages
      render 'film_new'
    end
  end

  def

  def edit

  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to '/'
  end

  private

  def review_params
    params.require(:review).permit(:text, :user_id)
  end

  def authenticate
    redirect_to '/' unless current_user.trusted
  end

end
