class Public::UsersController < ApplicationController

  def confirm
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    
    @reviews = Review.where(user_id: params[:id]).order(rate: "DESC")
    @regions = RegionGenre.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
