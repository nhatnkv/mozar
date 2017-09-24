# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#

class LineItem < ApplicationRecord
  has_many :line_items_product
  belongs_to :cart
end
