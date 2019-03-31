class RemoveDateAttributeFromPlannersTable < ActiveRecord::Migration[4.2]
  def change
    remove_column :planners, :date, :date
  end
end
