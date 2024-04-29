class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def layout_by_resource
    devise_controller? ? "#{resource_class.to_s.downcase}_devise" : "application"
  end

  helper_method :current_sales_profile

  def current_sales_profile
    current_sales_employee.try(:sales_profile)
  end
end
