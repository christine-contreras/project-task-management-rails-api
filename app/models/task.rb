class Task < ApplicationRecord
  belongs_to :board
  has_one :project, through: :board
  
end
