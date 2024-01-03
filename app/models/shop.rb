class Shop < ApplicationRecord
  has_one_attached :image

  has_many :reviews, dependent: :destroy
  belongs_to :region_genre

end
