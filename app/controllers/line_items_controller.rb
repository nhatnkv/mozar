class LineItemsController < ApplicationController
  before_action :set_cart, only: %i[create destroy]

  def create
    @product = Product.find(line_item_params[:product_id])
    @line_item = @cart.add_product(@product.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.js
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.require(:line_item).permit(:product_id)
  end
end
