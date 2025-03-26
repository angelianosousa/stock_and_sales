module StockHelper
  def badge_move_type(stock)
    style = stock.shop? ? 'danger' : 'success'
    text = Stock.human_attribute_name "move_type.#{stock.move_type}"

    tag.span class: "badge badge-#{style} font-weight-bold", style: 'font-size: 12px;' do
      text.upcase
    end
  end

  def stock_move_types_for_select
    Stock.move_types.map { |key, _value| [Stock.human_attribute_name("move_type.#{key}"), key.to_sym] }
  end

  def stock_move_types_for_select_search
    Stock.move_types.map { |key, value| [Stock.human_attribute_name("move_type.#{key}"), value] }
  end

  def products_options_for_select
    current_company.products.map { |prd| ["(#{prd.product_code}) #{prd.name}", prd.id] }
  end
end
