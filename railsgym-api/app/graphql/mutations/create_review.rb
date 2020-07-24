module Mutations
  class CreateReview < GraphQL::Schema::RelayClassicMutation
    graphql_name 'CreateReview'

    field :review, Types::ReviewType, null: true
    field :errors, [String], null: true

    argument :user_id, ID, required: true
    argument :item_id, ID, required: true
    argument :content, String, required: true

    def resolve(**args)
      item = Item.find(args[:item_id])
      review = item.reviews.build(
        user_id: args[:user_id],
        content: args[:content]
      )
      review.save
      {
        review: review,
        errors: review.errors.full_messages
      }
    end
  end
end
