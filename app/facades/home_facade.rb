class HomeFacade
  attr_reader :product

  def initialize(product)
    @product = product
    @images = @product.images.to_a
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

  def relead_products
    Product.where(category_id: @product.category_id).limit(3)
  end
end