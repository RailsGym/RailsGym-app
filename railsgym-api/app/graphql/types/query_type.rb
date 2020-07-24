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

    field :item, Types::ItemType, null: false do
      description '教材詳細'
      argument :id, ID, required: true, description: 'アイテムID'
    end
    def item(id:)
      Item.find(id)
    end
  end
end
