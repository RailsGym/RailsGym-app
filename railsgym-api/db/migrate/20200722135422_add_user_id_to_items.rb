class AddUserIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :user, index: true, foreign_key: true
  end
end
