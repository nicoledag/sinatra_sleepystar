class DeleteAgeAttributeFromBaby < ActiveRecord::Migration[4.2]
  def change
    remove_column :babies, :age, :string
  end
end
