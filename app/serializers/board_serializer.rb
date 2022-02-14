class BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at
  has_one :project
end
