class CreateAnimal < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :age
    end
  end
end
