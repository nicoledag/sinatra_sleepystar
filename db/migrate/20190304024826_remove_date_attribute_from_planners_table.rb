class RemoveDateAttributeFromPlannersTable < ActiveRecord::Migration
  def change
    remove_column :planners, :date, :date
  end
end
