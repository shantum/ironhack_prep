class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :deadline
      t.integer :base_price

      t.timestamps
    end
  end
end
