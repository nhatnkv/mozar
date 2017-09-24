# == Schema Information
#
# Table name: line_items_products
#
#  id            :integer          not null, primary key
#  product_id    :integer
#  line_items_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class LineItemsProduct < ApplicationRecord
  belongs_to :product
  belongs_to :line_items
end
