module Mutations
  class CreateItem < GraphQL::Schema::RelayClassicMutation
    graphql_name 'CreateItem'

    field :item, Types::ItemType, null: true
    field :result, Boolean, null: true

    argument :category_id, ID, required: true
    argument :title, String, required: true
    argument :url, String, required: true

    def resolve(**args)
      category = Category.find(args[:category_id])
      item = category.items.build(
        title: args[:title],
        url: args[:url],
      )
      item.save
      {
        item: item,
        result: item.errors.blank?
      }
    end
  end
end
