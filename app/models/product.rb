# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  price       :integer
#  description :text(65535)
#  quantity    :integer
#  status      :integer
#  tag         :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  STATUS = {display: 1, block: 2, empty: 3, sell: 4}
  belongs_to :category
  has_many   :images

  validates :name, :price, :description, :quantity, :status, presence: true
  validates :name, length: {maximum: 200}
  validates :description, length: {maximum: 2000}
  validates :price, :quantity, numericality: {only_integer: true}
  validates :price, numericality: {less_than_or_equal_to: 50_000_000}
  validates :quantity, numericality: {less_than_or_equal_to: 5_000}
  validates :status, inclusion: {in: STATUS.values}
end
