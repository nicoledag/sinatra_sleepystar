class AddDayToPlannersTable < ActiveRecord::Migration[4.2]
  def change
    add_column :planners, :day, :string
  end
end
