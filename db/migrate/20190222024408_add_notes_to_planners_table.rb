class AddNotesToPlannersTable < ActiveRecord::Migration[4.2]
  def change
    add_column :planners, :notes, :string
  end
end
