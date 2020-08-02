module Mutations
  class DeleteItem < GraphQL::Schema::RelayClassicMutation
    graphql_name 'DeleteItem'

    field :item, Types::ItemType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true

    def resolve(**args)
      item = Item.find(args[:id])
      item.destroy
      {
        item: item
      }
    end
  end
end
