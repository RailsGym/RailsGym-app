class RenameTechnologiesToCategories < ActiveRecord::Migration[6.0]
  def change
    rename_table :technologies, :categories
  end
end
