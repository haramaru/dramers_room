class Public::ShopsController < ApplicationController

  def show
    @shop = Shop.find(params[:id])
    @review = Review.new
    #@all_score = Review.where(shop_id: params[:id])
    #@average = @all_score.average(:rate)
  end

  def index
  end

  #def update
    #all_score = Review.where(params[:id])
    #new_average = all_score.average(:rate)
    #shop = Shop.find(params[:id])
    #shop.average = new_average
    #shop.update(shop_params)
    #redirect_to root_path
  #end

  private

end
