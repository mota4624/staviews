class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy] # ログインしてなければログイン画面へ戻す

  def index
    @reviews = Review.includes(:user).order('created_at DESC')
    
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).includes(:user).order(created_at: :desc)
    
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

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
    redirect_to root_path if current_user != @review.user
  end

  def update
    @review = Review.find(params[:id])

    if params[:review][:image_ids]
      params[:review][:image_ids].each do |image_id|
        image = @review.images.find(image_id)
        image.purge
      end
    end

    if @review.update(review_params)
      redirect_to review_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :category_id, :product_name, :brand, :purchase_date, :user_type, :positive_point,
                                   :negative_point, :recommendation, images: []).merge(user_id: current_user.id)
  end
end
