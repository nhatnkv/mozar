class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy update_checkout]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def show; end

  def update_checkout
    service = UpdateCart.new(@cart, params[:line_items])
    service.call
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
