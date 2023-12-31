class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_NAME_REGEX = /\A[a-z]+\z/
  validates :name, presence: true, length: { maximum: 20 }, format: { with: VALID_NAME_REGEX }
  validates :profile, presence: true, length: { maximum: 200 }
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', inverse_of: :follower, foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', inverse_of: :followed, foreign_key: 'followed_id',
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :likes, dependent: :destroy

  def feed
    Micropost.where(user_id: following_ids << id).includes(:user).order(updated_at: :desc)
  end

  def follow(other_user)
    following << other_user unless self == other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  # 現在のユーザーが他のユーザーをフォローしていればtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
end
