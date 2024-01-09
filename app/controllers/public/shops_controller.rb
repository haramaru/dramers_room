class Public::ShopsController < ApplicationController

  def show
    @shop = Shop.find(params[:id])
    @review = Review.new
    #@all_score = Review.where(shop_id: params[:id])
    #@average = @all_score.average(:rate)
  end

  def index
    @regions = RegionGenre.all
    if params[:shop_name]
      @shops = Shop.where('shop_name LIKE ?', "%#{params[:shop_name]}%").order(region_genre_id: "ASC")
    elsif params[:region_genre_id]
      @shops = Shop.where(region_genre_id: params[:region_genre_id]).order(region_genre_id: "ASC")
    else
      @shops = Shop.all.order(region_genre_id: "ASC")
    end
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
