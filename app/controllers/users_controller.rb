class UsersController < ApplicationController
  def show
    @name = current_user.name
    #    @reviews = current_user.reviews # 投稿機能実装後にコメントアウト
  end
end
