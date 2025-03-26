module SalesHelper
  def badge_status(sale)
    style = sale.open? ? 'secondary' : 'success'
    text = Sale.human_attribute_name "status.#{sale.status}"

    tag.span class: "badge badge-#{style} font-weight-bold", style: 'font-size: 12px;' do
      text.upcase
    end
  end

  def badge_payment_method(sale)
    style = sale.nil? ? '' : 'success'
    text = Sale.human_attribute_name "payment_method.#{sale.payment_method}"

    tag.span class: "badge badge-#{style} font-weight-bold", style: 'font-size: 12px;' do
      text.upcase
    end
  end

  def sales_payment_method_for_select
    Sale.payment_methods.map { |key, value| [Sale.human_attribute_name("payment_method.#{key}"), key.to_sym] }
  end
end
