module Types
  class MutationType < Types::BaseObject
    field :delete_task, mutation: Mutations::DeleteTask
    field :delete_review, mutation: Mutations::DeleteReview
    field :update_task, mutation: Mutations::UpdateTask
    field :create_task, mutation: Mutations::CreateTask
    field :create_item, mutation: Mutations::CreateItem
    field :create_review, mutation: Mutations::CreateReview
    field :update_review, mutation: Mutations::UpdateReview
    field :create_stock, mutation: Mutations::CreateStock
    field :delete_stock, mutation: Mutations::DeleteStock
  end
end
