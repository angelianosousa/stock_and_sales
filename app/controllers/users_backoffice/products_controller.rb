class UsersBackoffice::ProductsController < UsersBackofficeController
  before_action :set_product, only: %i[ edit update destroy ]

  # GET /products or /products.json
  def index
    unless params[:product_code]
      @products = Product.all.includes(:category).page(params[:page])
    else
      @products = Product._search_product_code_(params[:product_code], params[:page])
    end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to users_backoffice_products_url, notice: "Produto cadastrado com sucesso!" }
        format.json { redirect_to users_backoffice_products_url, status: :created }
      else
        format.html { redirect_to users_backoffice_products_url, status: :unprocessable_entity, alert: @product.errors }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to users_backoffice_products_url, notice: "Produto atualizado com sucesso!" }
        format.json { redirect_to users_backoffice_products_url, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: @product.errors }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to users_backoffice_products_url, notice: "Produto apagado com sucesso!" }
      format.json { head :no_content }
    end
  end

  # TODO import products with excel or csv or svg
  def import_products
  end

  # TODO destroy multiple products at once
  def destroy_product_selected
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:category_id, :picture, :title, :price, :in_stock, :safety_margin)
  end
end
