module Mutations
  class DeleteReview < GraphQL::Schema::RelayClassicMutation
    graphql_name 'DeleteReview'

    field :review, Types::ReviewType, null: true
    field :errors, [String], null: true

    argument :id, ID, required: true

    def resolve(**args)
      review = Review.find(args[:id])
      review.destroy
      {
          review: review,
          errors: review.errors.full_messages
      }
    end
  end
end
