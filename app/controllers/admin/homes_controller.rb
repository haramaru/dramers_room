class Admin::HomesController < ApplicationController
  def top
    @reviews = Review.all.order(created_at: "DESC")
    @regions = RegionGenre.all
  end
end
