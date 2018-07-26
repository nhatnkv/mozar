module HomesHelper
  def image_url(images, role)
    case role
    when 'main'
      image = images.find_by(tag: Image::TAG[:main]).try(:img)
    when 'assistant'
      image = images.where(tag: Image::TAG[:assistant]).sample.try(:img)
    end
    image = image.present? ? image.url(:img_540x728) : ''
  end

  def image_80x100(images)
    image = images.find_by(tag: Image::TAG[:main]).try(:img).url(:img_80x100)
  end

  def image_detail(image, default)
    image.present? ? image.img.url(:img_540x728) : default
  end
end
