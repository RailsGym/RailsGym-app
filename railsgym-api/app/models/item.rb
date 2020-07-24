class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :url, presence: true
end
