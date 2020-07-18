class RenameLearningMaterialsToItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :learning_materials, :items
  end
end
