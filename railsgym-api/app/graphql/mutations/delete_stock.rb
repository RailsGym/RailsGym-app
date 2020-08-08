module Mutations
  class DeleteStock < GraphQL::Schema::RelayClassicMutation
    graphql_name 'DeleteStock'

    field :stock, Types::StockType, null: true
    field :errors, [String], null: true

    argument :id, ID, required: true

    def resolve(**args)
      stock = Stock.find(args[:id])
      stock.destroy
      {
        stock: stock,
        errors: stock.errors.full_messages
      }
    end
  end
end