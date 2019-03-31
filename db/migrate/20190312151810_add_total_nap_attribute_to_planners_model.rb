class AddTotalNapAttributeToPlannersModel < ActiveRecord::Migration[4.2]
  def change
    add_column :planners, :total_nap_time, :string
  end
end
