module SalesHelper
  def badge_status(sale)
    style = sale.open? ? 'secondary' : 'success'

    tag.span class: "badge badge-#{style} font-weight-bold", style: 'font-size: 12px;' do
      sale.status.upcase
    end
  end
end
