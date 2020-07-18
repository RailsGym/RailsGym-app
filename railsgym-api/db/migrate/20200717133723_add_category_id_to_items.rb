class AddCategoryIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :category, index: true, foreign_key: true
  end
end
