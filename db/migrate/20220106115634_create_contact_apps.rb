class CreateContactApps < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_apps do |t|
      t.string :firstname
      t.string :lastname
      t.string :phonenumber
      t.string :address
      t.string :sex
      t.integer :age

      t.timestamps
    end
  end
end
