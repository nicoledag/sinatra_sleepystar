class CreateBabies < ActiveRecord::Migration[4.2]
  def change
    create_table :babies do |t|
      t.string :name
      t.string :age
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
