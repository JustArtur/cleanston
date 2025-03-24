class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.text :description
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
