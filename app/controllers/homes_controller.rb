class HomesController < ApplicationController
  def index
    @products = Product.includes(:images).all
  end
end
