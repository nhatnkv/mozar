class HomesController < ApplicationController
  before_action :set_product, only: [:detail, :show]
  def index
    @products = Product.all
  end

  def show
  end

  def detail
    images = @product.images.to_a
    @image_main = images.find do |image|
      image.tag == Image::TAG[:main]
    end
    @images_normal = images.select do |image|
      image.tag != 'main'
    end.to_a

    @relead_products = Product.where(category_id: @product.category_id).limit(3)
  end

  private

  def set_product
    @product = Product.find(params[:id])
    redirect_to root_path unless @product
  end
end
