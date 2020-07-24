module Types
  class MutationType < Types::BaseObject
    field :delete_task, mutation: Mutations::DeleteTask
    field :update_task, mutation: Mutations::UpdateTask
    field :create_task, mutation: Mutations::CreateTask
    field :create_item, mutation: Mutations::CreateItem
    field :create_review, mutation: Mutations::CreateReview
  end
end
