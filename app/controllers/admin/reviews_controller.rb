class Admin::ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_homes_top_path
  end

end
