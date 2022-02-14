class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :favorite, :color

  has_many :boards
end
