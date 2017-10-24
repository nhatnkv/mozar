class ChangeColumnImage < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :url, :img
  end
end
