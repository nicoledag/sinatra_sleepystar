class DeleteDayAttributePlannersTable < ActiveRecord::Migration[4.2]
  def change
    remove_column :planners, :day, :string
  end
end
