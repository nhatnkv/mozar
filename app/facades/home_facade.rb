class HomeFacade
  attr_reader :product
  RELATED_PRODUCT = 3

  def initialize(product)
    @product = product
    @images = product.images.to_a
  end

  def image_main
    @images.find do |image|
      image.tag == Image::TAG[:main]
    end
  end

  def images_normal
    @images.select do |image|
      image.tag != Image::TAG[:main]
    end
  end

  def related_products
    Product.where(category_id: product.category_id).limit(RELATED_PRODUCT)
  end
end