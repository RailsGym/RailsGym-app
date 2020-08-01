module Mutations
  class DeleteReview < GraphQL::Schema::RelayClassicMutation
    graphql_name 'DeleteReview'

    field :review, Types::ReviewType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true

    def resolve(**args)
      review = Review.find(args[:id])
      review.destroy
      {
          review: review
      }
    end
  end
end
