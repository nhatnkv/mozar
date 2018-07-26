class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts, &:timestamps
  end
end
