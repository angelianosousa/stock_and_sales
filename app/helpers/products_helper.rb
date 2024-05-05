module ProductsHelper
  def products_options_for_select
    Product.with_stock.all.map do |product|
      [product.title, product.id]
    end
  end
  
  def stock_label(product)
    icon = product.in_stock < product.safety_margin ? 'fa fa-face-frown' : 'fa fa-face-smile'
    
    content_tag :span, class: "icon" do
      content_tag :i, class: icon, style: 'font-size: 27px; border: 50%;' do
        
      end
    end
  end
end
