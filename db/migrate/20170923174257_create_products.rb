class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.integer :quantity
      t.integer :status
      t.string :tag
      t.integer :category_id

      t.timestamps
    end
  end
end
