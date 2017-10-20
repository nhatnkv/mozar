class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_line_item, only: [:update, :destroy]

  def create
    product = Product.find(line_item_params[:product_id])
    @line_item = @cart.add_product(product.id)

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

  def update
    @line_item.update(quantity: params[:quantity])
    respond_to do |format|
      format.json { render json: @cart}
    end
  end

  def destroy
    @line_item = @cart.line_items.find(params[:id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.js
    end
  end

  private
    def set_line_item
      @line_item = @cart.line_items.find(params[:id])
      redirect_to root_path if @line_item.blank?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
