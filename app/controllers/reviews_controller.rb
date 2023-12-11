class ReviewsController < ApplicationController

  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
        else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :category_id, :product_name, :brand, :purchase_date, :user_type, :positive_point, :negative_point, :recommendation, images: []).merge(user_id: current_user.id)
  end

end
