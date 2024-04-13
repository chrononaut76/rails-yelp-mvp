class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[ new create ]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save ? redirect_to(restaurant_path(@restaurant)) : render("new")
  end

  def edit

  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
