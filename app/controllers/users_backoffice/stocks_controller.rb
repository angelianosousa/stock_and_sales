class UsersBackoffice::StocksController < UsersBackofficeController
  before_action :set_stock, only: %i[edit update destroy]

  def index
    @q = current_company.stocks.ransack(params[:q])

    @stocks = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
  end

  def new
    @stock = current_company.stocks.build
  end

  def create
    @stock = current_company.stocks.build(stock_params)

    if @stock.save
      redirect_to users_backoffice_stocks_path, notice: 'Estoque lançado com sucessp'
    else
      redirect_to users_backoffice_stocks_path, alert: @stock.errors.full_messages
    end
  end

  def edit; end

  def update
    if @stock.update(stock_params)
      redirect_to users_backoffice_stocks_path, notice: 'Estoque lançado com sucessp'
    else
      redirect_to users_backoffice_stocks_path, alert: @stock.errors.full_messages
    end
  end

  private

  def set_stock
    @stock = current_company.stocks.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:move_type, :price_cents, :quantity, :company_id, :product_id)
  end
end
