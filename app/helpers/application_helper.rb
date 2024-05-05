module ApplicationHelper
  def simple_date_format(date)
    return '-' unless date.present?

    I18n.l date, format: :long
  end

  def link_to_go_back
    content_tag :p, class: 'text-right' do
      index_path = "users_backoffice_#{controller_name}_path"
      index_path = method(index_path).call

      link_to index_path, class: 'btn btn-secondary btn-round' do
        content_tag :span, class: 'icon' do
          content_tag :i, class: 'fa fa-arrow-left text-white', style: 'font-size: 12px;' do
            ' Voltar'
          end
        end
      end
    end
  end
end
