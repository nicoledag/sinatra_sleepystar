class AddTotalAttributesToPlanner < ActiveRecord::Migration
  def change
    add_column :planners, :morning_nap_total_time, :string
    add_column :planners, :midday_nap_total_time, :string
    add_column :planners, :late_afternoon_nap_total_time, :string
  end
end
