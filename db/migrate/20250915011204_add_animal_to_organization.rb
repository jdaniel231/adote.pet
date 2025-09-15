class AddAnimalToOrganization < ActiveRecord::Migration[7.1]
  def change
    add_column :animals, :organization_id, :integer
  end
end
