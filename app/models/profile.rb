# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text(65535)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ApplicationRecord
  validates :name, :address, :phone, presence: true
  validates :name, length: {maximum: 200}
  validates :address, length: {maximum: 200}
  validates :phone, length: {maximum: 11}
end
