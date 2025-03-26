module ProductsHelper
  def products_options_for_select
    current_company.products.with_stock.map do |product|
      ["(#{product.product_code}) #{product.name}", product.id]
    end
  end
end
