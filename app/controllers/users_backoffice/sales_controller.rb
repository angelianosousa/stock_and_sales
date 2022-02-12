class UsersBackoffice::SalesController < UsersBackofficeController
  before_action :set_sale, only: %i[ show edit update destroy ]

  # GET /sales or /sales.json
  def index
    unless params[:sales_code]
      @sales = Sale.where(sales_profile: current_sales_employee.sales_profile).includes(:products, :sales_profile => :sales_employee).page(params[:page])
    else
      @sales = Sale._search_sales_(current_sales_employee.sales_profile, params[:sales_code], params[:page])
    end
  end

  def new
    @sale = Sale.new
    @sale.products.build
  end

  def show
  end

  # GET /sales/1/edit
  def edit
    @sale.products.build if @sale.products.blank?
  end

  # FIXME need implement to a way better to add products and find a way to save a number for each product adds
  # POST /sales or /sales.json
  def create
    @sale = Sale.new(sale_params)
    params[:sale][:products].shift

    @sale.sales_profile = current_sales_employee.sales_profile
    @sale.products << Product.find(params[:sale][:products])
    @sale.date_sale = Date.today
    # @sale.amount

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
    params.require(:sale).permit(:sales_profile_id, :products, :amount, :amount_price, :date_sale)
  end
end
