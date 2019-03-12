class AddTotalNapAttributeToPlannersModel < ActiveRecord::Migration
  def change
    add_column :planners, :total_nap_time, :string
  end
end
