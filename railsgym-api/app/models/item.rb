class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :url, presence: true
end
