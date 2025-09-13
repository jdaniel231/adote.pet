class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :address
      t.string :address_number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :document_number
      t.integer :user_type

      t.timestamps
    end
  end
end
