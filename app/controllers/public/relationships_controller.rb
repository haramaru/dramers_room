class Public::RelationshipsController < ApplicationController

  def create
    followed = User.find(params[:user_id])
    follower = current_user.followers.new(followed_id: followed.id)
    follower.save
    redirect_to user_path(followed)
  end

  def destroy
    followed = User.find(params[:user_id])
    follower = current_user.followers.find_by(followed_id: followed.id)
    follower.destroy
    redirect_to user_path(followed)
  end

end
