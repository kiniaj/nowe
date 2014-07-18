class AddAnimalIdToFood < ActiveRecord::Migration
  def change
    add_column :foods, :animal_id, :integer
  end
end
