module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    @cart = Cart.find(session[:cart_id]).decorate
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create.decorate
    session[:cart_id] = @cart.id
  end
end
