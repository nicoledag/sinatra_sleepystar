class DeleteAgeAttributeFromBaby < ActiveRecord::Migration
  def change
    remove_column :babies, :age, :string
  end
end
