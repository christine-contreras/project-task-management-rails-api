class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :due_date, :description, :status, :priority, :completed, :created_at, :updated_at
  has_one :board
  has_one :project
end
