class AddTagToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :tag, :integer
  end
end
