class RegionGenre < ApplicationRecord

  validates :region, presence: true

  has_many :shops, dependent: :destroy

end
