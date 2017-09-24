# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  order_detail_id :integer
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Order < ApplicationRecord
  STATUS = {received: 1, transfering: 2, pending: 3, rollback: 4, cancel: 5, completed: 6}
  belongs_to :order_detail

  validates :status, inclusion: {in: STATUS.values}
end
