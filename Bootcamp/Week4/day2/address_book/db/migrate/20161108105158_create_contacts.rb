class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :Name
      t.text :Address
      t.integer :Phone
      t.string :Email

      t.timestamps
    end
  end
end
