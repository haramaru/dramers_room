class RegionGenre < ApplicationRecord

  has_many :shops, dependent: :destroy

end
