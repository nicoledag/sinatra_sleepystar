class CreatePlanners < ActiveRecord::Migration[4.2]
  def change
    create_table :planners do |t|
      t.date :date
      t.string :wake_time
      t.string :bed_time
      t.integer :baby_id

      t.timestamps null: false
    end
  end
end
