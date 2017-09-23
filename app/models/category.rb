# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  level      :integer
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  LEVEL = {small: 3, medium: 2, major: 1}

  has_many :children, class_name: self.name, foreign_key: :parent_id
  belongs_to :parent, class_name: self.name, foreign_key: :parent_id, optional: true

  validates :name, presence: true, length: {maximum: 200}
  validates :level, presence: true, numericality: {only_integer: true}
end
