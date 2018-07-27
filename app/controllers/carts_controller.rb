class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy update_checkout]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def show; end

  def update_checkout
    update_cart_service = UpdateCart.new(@cart)
    update_cart_service.call(params[:line_items])
  end

  private

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_url, notice: 'Invalid cart'
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id]).decorate
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.fetch(:cart, {})
  end
end
