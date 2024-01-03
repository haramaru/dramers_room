class Admin::ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def create
    shop = Shop.new(shop_params)
    shop.save
    redirect_to admin_shop_path(shop.id)
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to admin_shop_path(@shop.id)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def index
    if params[:shop_name]
      @shops = Shop.where('shop_name LIKE ?', "%#{params[:shop_name]}%")
    elsif params[:region_genre_id]
      @shops = Shop.where(region_genre_id: params[:region_genre_id])
    else
      @shops = Shop.all
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :telephone_number, :address, :image, :region_genre_id)
  end

end
