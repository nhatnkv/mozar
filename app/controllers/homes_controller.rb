class HomesController < ApplicationController
  before_action :set_product, only: [:detail, :show]
  def index
    @products = Product.all
  end

  def show
  end

  def detail
    @home_facade = HomeFacade.new(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
    redirect_to root_path unless @product
  end
end
