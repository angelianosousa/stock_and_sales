class UsersBackoffice::SalesController < UsersBackofficeController
  before_action :set_sale, only: %i[show edit update destroy]

  # GET /sales or /sales.json
  def index
    if params[:sales_code]
      @sales = Sale._search_sales_(current_sales_employee.sales_profile, params[:sales_code], params[:page])
    else
      @sales = Sale.where(sales_profile: current_sales_employee.sales_profile).includes(:sales_profile => :sales_employee).page(params[:page])
    end
  end

  def new
    @sale = Sale.new
  end

  def show
  end

  # GET /sales/1/edit
  def edit
    @sale.sale_items_build if @sale.sale_items.blank?
    
  end

  # POST /sales or /sales.json
  def create
    @sale = Sale.new(sale_params)
    @sale.sales_profile = current_sales_employee.sales_profile

    respond_to do |format|
      if @sale.save
        format.html { redirect_to users_backoffice_sale_url(@sale), 
          notice: "Registro de Venda criado com sucesso!" }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to users_backoffice_sale_url(@sale), 
          notice: "Registro de Venda atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1 or /sales/1.json
  def destroy
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to users_backoffice_sales_url, 
        notice: "Regitro de venda apagado com sucesso!" }
      format.json { head :no_content }
    end
  end

  # TODO generate a pdf for the sales
  def sale_pdf
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = Sale.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sale_params
    params.require(:sale).permit(:sales_profile_id, :client_name, sale_items_attributes: [:id, :sale_id, :product_id, :sold_amount, :_destroy])
  end
end
