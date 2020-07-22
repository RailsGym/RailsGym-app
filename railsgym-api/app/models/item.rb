class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :title, uniqueness: true
end
