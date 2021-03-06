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
  LEVEL = { small: 3, medium: 2, root: 1 }.freeze

  has_many :children, class_name: name, foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent, class_name: name, foreign_key: :parent_id, optional: true
  has_many :products

  validates :name, presence: true, length: { maximum: 200 }

  before_save :set_level
  after_save :update_level, if: :child?

  def set_level
    if children.any? && parent.present?
      self.level = LEVEL[:medium]
    elsif parent.nil?
      self.level = LEVEL[:root]
    elsif children.blank?
      self.level = LEVEL[:small]
    end
  end

  def update_level
    category = Category.find(parent_id)
    category.update(level: LEVEL[:medium]) if category.present? && category.parent_id
  end

  def child?
    level == LEVEL[:small]
  end
end
