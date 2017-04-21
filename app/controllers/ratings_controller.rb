class RatingsController < ApplicationController
  before_action :authenticate_user!


    def new_film_rating
      @rating = Rating.new
    end

    def create_film_rating
      film_rating_post_params
      @film = Film.find(params[:film_id])
      @rating = @film.ratings.new(stars: params[:rating][:stars].to_i, user: current_user)
      if @rating.save
        redirect_to @film
      else

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
  def film_rating_post_params
    params.require(:rating).permit(:stars, :film_id)
  end

  def review_rating_post_params
    params.require(:rating).permit(:stars, :review_id)
  end
end
