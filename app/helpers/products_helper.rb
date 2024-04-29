module ProductsHelper
  def products_options_for_select
    Product.with_stock.all.map do |product|
      [product.title, product.id]
    end
  end
end
