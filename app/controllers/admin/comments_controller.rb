class Admin::CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to admin_homes_top_path
  end

end
