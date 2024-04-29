require './app/services/create_sale'

class UsersBackoffice::SalesController < UsersBackofficeController
  before_action :set_sale, only: %i[show edit update destroy]

  def dashboad_sales
    @sales = Sale.where(sales_profile: current_sales_profile).includes(:sales_profile => :sales_employee).page(params[:page])
  end

  # GET /sales or /sales.json
  def index
    @q = current_sales_profile.sales.ransack(params[:q])

    @sales = @q.result(distinct: true).includes(sales_profile: :sales_employee).page(params[:page])
  end

  def new
    @sale = current_sales_profile.sales.build
  end

  def show
    @products = Product.with_stock
  end

  # GET /sales/1/edit
  def edit; end

  def add_item
    @sale = Services::CreateSale.new(current_sales_profile, params).call

    if @sale.save
      redirect_to users_backoffice_sale_url(@sale), notice: 'Item adicionado com sucesso!!'
    else
      redirect_to users_backoffice_sale_url(@sale), alert: @sale.errors.full_messages
    end
  end

  def remove_item
    @sale = Services::CreateSale.new(current_sales_profile, params).call

    if @sale.save
      redirect_to users_backoffice_sale_url(@sale), notice: 'Item removido com sucesso!!'
    else
      redirect_to users_backoffice_sale_url(@sale), alert: @sale.errors.full_messages
    end
  end

  def close_sale
    @sale = Services::CreateSale.new(current_sales_profile, params).call

    if @sale.save
      redirect_to users_backoffice_sales_url, notice: 'Registro de Venda finalizada com sucesso!'
    else
      redirect_to users_backoffice_sales_url, alert: @sale.errors.full_messages
    end
  end

  # POST /sales or /sales.json
  def create
    @sale = current_sales_profile.sales.build(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to users_backoffice_sale_url(@sale), notice: "Registro de Venda criado com sucesso!" }
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
        format.html { redirect_to users_backoffice_sale_url(@sale), notice: "Registro de Venda atualizado com sucesso!" }
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
      format.html { redirect_to users_backoffice_sales_url, notice: "Regitro de venda apagado com sucesso!" }
      format.json { head :no_content }
    end
  end

  # TODO generate a pdf for the sales
  def sale_pdf
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = current_sales_profile.sales.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sale_params
    params.require(:sale).permit(:sales_profile_id, :client_name, sale_items_attributes: [:id, :sale_id, :product_id, :sold_amount, :subtotal_price, :_destroy])
  end
end
