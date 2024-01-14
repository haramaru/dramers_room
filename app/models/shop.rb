class Shop < ApplicationRecord
  has_one_attached :image

  validates :shop_name, presence: true
  validates :telephone_number, presence: true
  validates :address, presence: true
  validates :region_genre_id, presence: true
  validates :image, presence: true

  has_many :reviews, dependent: :destroy
  belongs_to :region_genre

end
