class ChangeDataUrlToItem < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :url, :text
  end
end
