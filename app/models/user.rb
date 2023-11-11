class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_NAME_REGEX = /\A[a-z]+\z/
  validates :name, presence: true, length: { maximum: 20 }, format: { with: VALID_NAME_REGEX }
  validates :profile, presence: true, length: { maximum: 200 }
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id',
                                  dependent: destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
end
