class AddNotesToPlannersTable < ActiveRecord::Migration
  def change
    add_column :planners, :notes, :string
  end
end
