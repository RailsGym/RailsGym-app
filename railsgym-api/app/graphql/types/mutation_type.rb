module Types
  class MutationType < Types::BaseObject
    field :delete_task, mutation: Mutations::DeleteTask
    field :update_task, mutation: Mutations::UpdateTask
    field :create_task, mutation: Mutations::CreateTask
    field :create_item, mutation: Mutations::CreateItem
  end
end
