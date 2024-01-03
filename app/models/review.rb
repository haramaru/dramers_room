class Review < ApplicationRecord

  belongs_to :user
  belongs_to :shop
  has_many :comments, dependent: :destroy
  has_many :review_favorites, dependent: :destroy

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true

  def favorited_by?(user)
    review_favorites.exists?(user_id: user.id)
  end

end
