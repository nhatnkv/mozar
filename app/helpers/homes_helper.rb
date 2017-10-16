module HomesHelper
  def image_url images, role
    case role
    when "main"
      image = images.find_by(tag: Image::TAG[:main]).try(:url)
    when "assistant"
      image = images.where(tag: Image::TAG[:assistant]).sample.try(:url)
    end
    image = image.present? ? image : ''
  end
end
