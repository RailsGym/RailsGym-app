class Category < ApplicationRecord
  has_many :items
  validates :name, uniqueness: true

  def item_count
    items.count
  end
end
