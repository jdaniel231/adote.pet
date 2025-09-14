class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :specie
      t.string :breed
      t.string :description
      t.string :photo
      t.string :status

      t.timestamps
    end
  end
end
