class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :order_detail_id
      t.integer :status

      t.timestamps
    end
  end
end
