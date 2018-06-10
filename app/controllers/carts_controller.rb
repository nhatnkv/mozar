class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :update_checkout]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def show
  end

  def update_checkout
    line_items = @cart.line_items.to_a
    line_items.each do |line_item|
      line_item.update(quantity: params[:line_items]["#{line_item.id}"].to_i)
    end
  end

  private
    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_url, notice: 'Invalid cart'
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end
end
