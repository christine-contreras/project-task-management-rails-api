class AddDefaultsProjects < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :title, :string, :default => "New Project"
    change_column :projects, :favorite, :boolean, :default => false
    change_column :projects, :color, :string, :default => "#e1bee7"

  end
end
