class CommentsController < ApplicationController

  def film_new
    @film = Film.find(params[:film_id])
    @comment = @film.comments.new
  end

  def film_create
    @film = Film.find(params[:film_id])
    @comment = @film.comments.new(comment_params)
    if @comment.save
      redirect_to @film
    else
      @errors = @comment.errors.full_messages
      render 'film_new'
    end
  end

  def review_new
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new
  end

  def review_create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    if @comment.save
      redirect_to @review
    else
      @errors = @comment.errors.full_messages
      render 'review_new'
    end
  end

  def film_destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @film = Film.find(params[:film_id])
    redirect_to @film
  end

  def review_destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @review = Review.find(params[:review_id])
    redirect_to @review
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end

end
