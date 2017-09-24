class CreateLineItemsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items_products do |t|
      t.integer  :product_id
      t.integer  :line_items_id
      t.timestamps
    end
  end
end
