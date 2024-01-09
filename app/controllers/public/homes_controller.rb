class Public::HomesController < ApplicationController

  def top
    @shops = Shop.page(params[:page])
    @regions = RegionGenre.all
  end

  def about
    @regions = RegionGenre.all
  end

end
