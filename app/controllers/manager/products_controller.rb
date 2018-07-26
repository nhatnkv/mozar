class Manager::ProductsController < ManagerController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /manager/products
  # GET /manager/products.json
  def index
    @products = Product.all
  end

  # GET /manager/products/1
  # GET /manager/products/1.json
  def show; end

  # GET /manager/products/new
  def new
    @product = Product.new
  end

  # GET /manager/products/1/edit
  def edit; end

  # POST /manager/products
  # POST /manager/products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to manager_product_path(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/products/1
  # PATCH/PUT /manager/products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to manager_product_path(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/products/1
  # DELETE /manager/products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to manager_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :price, :description, :quantity, :status, :tag, :category_id)
  end
end
