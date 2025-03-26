require './app/services/create_sale'

class UsersBackoffice::SalesController < UsersBackofficeController
  before_action :set_sale, only: %i[show edit update destroy]

  def dashboad_sales
    @sales = current_company.sales.page(params[:page])
  end

  # GET /sales or /sales.json
  def index
    @q = current_company.sales.ransack(params[:q])

    @sales = @q.result(distinct: true).page(params[:page])
  end

  def new
    @sale = current_company.sales.build
  end

  def show; end

  # GET /sales/1/edit
  def edit; end

  # POST /sales or /sales.json
  def create
    @sale = current_company.sales.build(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to users_backoffice_sale_url(@sale), notice: "Pedido de Venda criado com sucesso!" }
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
        format.html { redirect_to users_backoffice_sale_url(@sale), notice: "Pedido de Venda atualizado com sucesso!" }
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
      format.html { redirect_to users_backoffice_sales_url, notice: "Pedido de venda apagado com sucesso!" }
      format.json { head :no_content }
    end
  end

  def add_item
    @sale = Services::CreateSale.new(current_company, params).call

    if @sale.save
      redirect_to users_backoffice_sale_url(@sale), notice: 'Item adicionado com sucesso!!'
    else
      redirect_to users_backoffice_sale_url(@sale), alert: @sale.errors.full_messages
    end
  end

  def remove_item
    @sale = Services::CreateSale.new(current_company, params).call

    if @sale.save
      redirect_to users_backoffice_sale_url(@sale), notice: 'Item removido com sucesso!!'
    else
      redirect_to users_backoffice_sale_url(@sale), alert: @sale.errors.full_messages
    end
  end

  def close_sale
    @sale = Services::CreateSale.new(current_company, params).call

    if @sale.save
      redirect_to users_backoffice_sales_url, notice: 'Pedido de Venda finalizada com sucesso!'
    else
      redirect_to users_backoffice_sales_url, alert: @sale.errors.full_messages
    end
  end

  # TODO generate a pdf for the sales
  def sale_pdf
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = current_company.sales.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sale_params
    params.require(:sale).permit(:client_name, :payment_method, sale_items_attributes: [:id, :sale_id, :product_id, :sold_amount, :subtotal_price, :_destroy])
  end
end
