class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name
      t.integer :price
      t.text :description
      t.integer :stock
      t.text :image
      t.integer :category_id

      t.timestamps
    end
  end
end
