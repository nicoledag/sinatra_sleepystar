class AddDayToPlannersTable < ActiveRecord::Migration
  def change
    add_column :planners, :day, :string
  end
end
