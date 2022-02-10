class UsersBackoffice::SalesController < UsersBackofficeController
  before_action :set_sale, only: %i[ edit update destroy ]

  # GET /sales or /sales.json
  def index
    if params[:sales_code]
      @sales = Sale._search_sales_(params[:sales_code], params[:page])
    else
      @sales = Sale.all.includes(:product).page(params[:page])
    end
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales or /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to users_backoffice_sales_url, notice: "Registro de Venda criado com sucesso!" }
        format.json { redirect_to users_backoffice_sales_url, status: :created }
      else
        format.html { redirect_to users_backoffice_sales_url, status: :unprocessable_entity, alert: @sale.errors }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to sale_url(@sale), notice: "Registro de Venda atualizado com sucesso!" }
        format.json { redirect_to users_backoffice_sales_url, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: @sale.errors }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1 or /sales/1.json
  def destroy
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to users_backoffice_sales_url, notice: "Regitro de venda apagado com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:sales_profile_id, :product_id, :amount, :amount_price, :date_sale)
    end
end
