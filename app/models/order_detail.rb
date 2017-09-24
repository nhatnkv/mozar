# == Schema Information
#
# Table name: order_details
#
#  id             :integer          not null, primary key
#  username       :string(255)
#  address        :text(65535)
#  phone          :string(255)
#  note           :text(65535)
#  price          :integer
#  line_item_id   :integer
#  payment_method :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class OrderDetail < ApplicationRecord
  PAYMENT_METHOD = {online: 1, cash: 2}
  validates :username, :address, :phone, :price, presence: true
  validates :payment_method, inclusion: {in: PAYMENT_METHOD.values}
  validates :username, length: {maximum: 200}
  validates :phone, length: {maximum: 11}
  validates :note, length: {maximum: 2000}
end
