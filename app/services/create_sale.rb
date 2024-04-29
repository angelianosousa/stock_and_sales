# Flow
# 1 - Encontrar o produto
# 2 - Checar se o produto está disponivel no estoque
#   - Caso tenha suficiente -> Realizar venda
#     - Somar valor subtotal da venda
#     - Somar valor total da venda
#   - Caso não tenha suficiente -> Impedir venda e emitir erro
module Services
  class CreateSale
    def initialize(sales_profile, params)
      @sale             = sales_profile.sales.find(params[:sale_id])
      @params           = params
      @action           = @params[:action]
      @total_sale_price = 0
    end

    def call
      ActiveRecord::Base.transaction do 
        begin
          add_sale_item    if (@action == 'add_item' && validate_operation)
          remove_sale_item if @action == 'remove_item'
          finish_sale      if @action == 'close_sale'
        rescue ActiveRecord::Rollback => e
          p e.message
        end
        
        @sale
      end
    end  
    
    # Item deve ser adicionado somente se estiver quantidade disponível
    def add_sale_item
      validate_operation

      @sale_item             = @sale.sale_items.build
      @sale_item.product     = find_product
      @sale_item.sold_amount = @params[:sold_amount]
      sum_total_price
    end

    # Item é removido e retorna o estoque e recalcula preço da venda
    def remove_sale_item
      @sale_item = @sale.sale_items.find(@params[:sale_item_id])
      @sale_item.return_product!
      @sale_item.destroy
      sum_total_price
    end

    def finish_sale
      @sale.payment_method = @params[:payment_method]
      @sale.status         = :paid
      @sale.saled_at       = DateTime.now
    end

    private

    def validate_operation
      product = find_product

      unless (product.in_stock.to_i - @params[:sold_amount].to_i) > 0
        @sale.errors.add :base, :invalid, message: "O estoque do produto #{product.title} não pode ficar negativo!!"
        return false
      end

      true
    end

    def sum_total_price
      @sale.total_price_cents = 0

      @sale.sale_items.each do |item|
        item.subtotal_price_cents = item.product.price_cents * item.sold_amount
        @total_sale_price        += item.subtotal_price_cents

        item.product.in_stock    -= item.sold_amount
        item.product.save!
      end

      @sale.total_price_cents = @total_sale_price
    end

    def find_product
      Product.find(@params[:product_id])
    end
  end

end
