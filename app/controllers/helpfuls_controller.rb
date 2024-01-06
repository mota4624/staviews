class HelpfulsController < ApplicationController
  before_action :set_review

  def create
    helpful = current_user.helpfuls.build(review_id: params[:review_id])
    helpful.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    helpful = Helpful.find_by(review_id: params[:review_id], user_id: current_user.id)
    helpful.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_review
    @review = Review.find(params[:review_id])
  end

end
