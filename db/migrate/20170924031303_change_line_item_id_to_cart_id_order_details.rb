class ChangeLineItemIdToCartIdOrderDetails < ActiveRecord::Migration[5.1]
  def change
    rename_column :order_details, :line_item_id, :cart_id
  end
end
