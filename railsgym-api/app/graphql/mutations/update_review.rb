module Mutations
  class UpdateReview < GraphQL::Schema::RelayClassicMutation
    graphql_name 'UpdateReview'

    field :review, Types::ReviewType, null: true
    field :errors, [String], null: true

    argument :id, ID, required: true
    argument :content, String, required: true

    def resolve(**args)
      review = Review.find(args[:id])
      review.update(content: args[:content])
      {
          review: review,
          errors: review.errors.full_messages
      }
    end
  end
end