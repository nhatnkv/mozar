class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.string  :username
      t.text    :address
      t.string  :phone
      t.text    :note
      t.integer :price
      t.integer :line_item_id
      t.integer :payment_method

      t.timestamps
    end
  end
end
