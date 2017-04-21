class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @films = Film.all
    @reviews = @category.recent
    @display = true
  end
end
