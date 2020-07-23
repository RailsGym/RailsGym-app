class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true
end
