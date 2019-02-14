class CreatePlanners < ActiveRecord::Migration
  def change
    create_table :planners do |t|
      t.string :day
      t.string :wake_time
      t.integer :baby_id

      t.timestamps null: false
    end
  end
end
