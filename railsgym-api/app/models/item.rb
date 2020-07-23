class Item < ApplicationRecord
  belongs_to :category
  validates :title, uniqueness: true
end
