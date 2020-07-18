module Types
  class QueryType < Types::BaseObject
    field :tasks, [Types::TaskType], null: false, description: 'タスクを全件取得する'
    def tasks
      Task.all
    end

    field :categories, [Types::CategoryType], null: false, description: '技術一覧を全件取得する'
    def categories
      Category.all
    end

    field :category, Types::CategoryType, null: false do
      description '技術'
      argument :id, Int, required: true, description: 'カテゴリID'
    end
    def category(id:)
      Category.find(id)
    end


    # field :learning_materials, [Types::LearningMaterialType], null: false, description: '選択した技術の教材一覧を取得する'
    # def learning_materials
    #   p "■■■■■■■■■■■■■■■■■■■■■"
    #   p "■■■■■■■■■■■■■■■■■■■■■"
    #   p "■■■■■■■■■■■■■■■■■■■■■"
    #   LearningMaterial.where(technology_id: technologyId)
    # end
  end
end
