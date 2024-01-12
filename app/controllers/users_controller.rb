class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    if params[:id].to_i == current_user.id
      # ログインユーザーの場合
      @user = current_user
      @reviews = current_user.reviews
    else
      # 他のユーザーの場合
      @user = User.find(params[:id])
      @reviews = @user.reviews
    end
  end
end
