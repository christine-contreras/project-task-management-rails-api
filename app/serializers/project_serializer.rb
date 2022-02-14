class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :favorite, :color
end
