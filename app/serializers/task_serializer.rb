class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :due_date, :description, :status, :priority, :completed, :created_at, :updated_at

  # def board
  #   self.board.name
  # end

  # def board_id
  #   self.board.id
  # end

  # def project
  #   self.board.name
  # end

  # def project_id
  #   self.project.id
  # end

end
