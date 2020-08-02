class User < ApplicationRecord
  has_secure_password

  has_many :items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :stocks, dependent: :destroy

  validates :username, uniqueness: true
  validates :email, uniqueness: true
end