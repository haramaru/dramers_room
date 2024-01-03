class Admin::RegionGenresController < ApplicationController

  def index
    @region = RegionGenre.new
    @regions = RegionGenre.all
  end

  def create
    region = RegionGenre.new(region_params)
    region.save
    redirect_to admin_region_genres_path
  end

  def edit
    @region = RegionGenre.find(params[:id])
  end

  def update
    region = RegionGenre.find(params[:id])
    region.update(region_params)
    redirect_to admin_region_genres_path
  end

  private

  def region_params
    params.require(:region_genre).permit(:region)
  end

end
