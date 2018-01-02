# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  img        :string(255)
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)
#  tag        :integer
#

class Image < ApplicationRecord
  TAG = {main: 1, assistant: 2}

  belongs_to :product
  mount_uploader :img, ImagesUploader

  validate :main_image_exist, on: :create

  def main_image_exist
    image = Image.find_by(product_id: self.product_id, tag: 1)
    if self.tag.eql?(1) && image.present?
      errors.add(:base, :invalid, message: "#{Product.find(product_id).name} had main image")
    end
  end
end
