class AddDefaultsTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :name, :string, :default => "New Task"
    change_column :tasks, :status, :string, :default => "Not Started"
    change_column :tasks, :priority, :string, :default => "Low"
    change_column :tasks, :completed, :boolean, :default => false
  end
end
