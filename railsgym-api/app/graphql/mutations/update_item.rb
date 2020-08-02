module Mutations
  class UpdateItem < GraphQL::Schema::RelayClassicMutation
    graphql_name 'UpdateItem'

    field :item, Types::ItemType, null: true
    field :errors, [String], null: true

    argument :id, ID, required: true
    argument :title, String, required: true
    argument :url, String, required: true

    def resolve(**args)
      item = Item.find(args[:id])
        errors: item.errors.full_messages
      }
    end
  end
end
