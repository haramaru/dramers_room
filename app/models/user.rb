class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :review_favorites, dependent: :destroy
  has_many :comment_favorites, dependent: :destroy

  has_many :followers,
          class_name: 'Relationship',
          foreign_key: 'follower_id',
          dependent: :destroy,
          inverse_of: :follower

  has_many :followeds,
          class_name: 'Relationship',
          foreign_key: 'followed_id',
          dependent: :destroy,
          inverse_of: :followed

  has_many :followed_users, through: :followers, source: :followed
  has_many :follower_users, through: :followeds, source: :follower

  def followed_by?(user)
    followeds.exists?(follower_id: user.id)
  end

end
