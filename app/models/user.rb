class User < ApplicationRecord
  has_many :microposts
  VALID_NAME_REGEX = /\A[a-z]+\z/
  validates :name, presence: true, length: { maximum: 20 }, format: { with: VALID_NAME_REGEX }
  validates :profile, presence: true, length: { maximum: 200 }
end
