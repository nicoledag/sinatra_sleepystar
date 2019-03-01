class DeleteDayAttributePlannersTable < ActiveRecord::Migration
  def change
    remove_column :planners, :day, :string
  end
end
