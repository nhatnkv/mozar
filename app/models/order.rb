# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text(65535)
#  email      :string(255)
#  pay_type   :integer
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
end
