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

FactoryGirl.define do
  factory :product do
    name 'product_1'
    quantity 10
    price 20
    status 1
    description 'abc'
  end
end
