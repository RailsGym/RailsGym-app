module Mutations
  class CreateStock < GraphQL::Schema::RelayClassicMutation
    graphql_name 'CreateStock'

    field :stock, Types::StockType, null: true
    field :errors, [String], null: true

    argument :user_id, ID, required: true
    argument :item_id, ID, required: true

    def resolve(**args)
      user = User.find(args[:user_id])
      stock = user.stocks.build(
        item_id: args[:item_id]
      )
      stock.save
      {
        stock: stock,
        errors: stock.errors.full_messages
      }
    end
  end
end
