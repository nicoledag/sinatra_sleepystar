class AddAttributesToPlannersTable < ActiveRecord::Migration[4.2]
  def change
    add_column :planners, :morning_nap_start_time, :string
    add_column :planners, :morning_nap_end_time, :string
    add_column :planners, :midday_nap_start_time, :string
    add_column :planners, :midday_nap_end_time, :string
    add_column :planners, :late_afternoon_nap_start_time, :string
    add_column :planners, :late_afternoon_nap_end_time, :string
  end
end
