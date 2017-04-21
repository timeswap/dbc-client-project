class RatingsController < ApplicationController
  before_action :authenticate_user!


    def new_film_rating
      @rating = Rating.new
    end

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

    def new_review_rating
      @rating = Rating.new
    end

    def create_review_rating
      review_rating_post_params
      @review = Review.find(params[:review_id])
      @rating = @review.ratings.new(stars: params[:rating][:stars].to_i, user: current_user)
      if @rating.save
        redirect_to @review
      else

      end
    end

private
  def post_params
    params.require(:rating).permit(:stars)
  end
end
