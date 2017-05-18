class CommentsController < ApplicationController
  before_action :authenticate_user!

  def film_new
    @film = Film.find(params[:film_id])
    @comment = @film.comments.new
    respond_to do |f|
      f.html
      f.js
    end
  end

  def film_create
    @film = Film.find(params[:film_id])
    @comment = @film.comments.new(comment_params)
    if @comment.save
      respond_to do |f|
        f.html {redirect_to @film}
        f.js
      end
    else
      @errors = @comment.errors.full_messages
      render 'film_new'
    end
  end

  def review_new
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new
    respond_to do |f|
      f.html
      f.js
    end
  end

  def review_create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    if @comment.save
      respond_to do |f|
        f.html {redirect_to @review}
        f.js
      end
    else
      @errors = @comment.errors.full_messages
      render 'review_new'
    end
  end

  def film_destroy
    @comment = Comment.find(params[:id])
    @id = params[:id]
    @comment.destroy
    @film = Film.find(params[:film_id])
    respond_to do |f|
      f.html {redirect_to @film}
      f.js
    end
  end

  def review_destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @id = params[:id]
    @review = Review.find(params[:review_id])
    respond_to do |f|
      f.html {redirect_to @review}
      f.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end

end
