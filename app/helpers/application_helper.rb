module ApplicationHelper
  def image_tag_cart line_item
    image = line_item.product.images.find_by(tag: 1)
    image.present? ? image.img : ""
  end
end
