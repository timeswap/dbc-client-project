class RatingsController < ApplicationController
  before_action :authenticate_user!


    def create_film_rating
      @film = Film.find(params[:film_id])
      @rating = @film.ratings.new(post_params)
      @rating.user=current_user
      if @rating.save
        redirect_to @film
      else
        @errors = @rating.errors.full_messages
        render 'new_film_rating'
      end
    end

    def create_review_rating
      @review = Review.find(params[:review_id])
      @rating = @review.ratings.new(post_params)
      @rating.user=current_user
      if @rating.save
        redirect_to @review
      else
        @errors = @rating.errors.full_messages
        render 'new_film_rating'
      end
    end

private
  def post_params
    params.require(:rating).permit(:stars)
  end
end
