class UsersBackofficeController < ApplicationController
  layout 'users_backoffice'
  before_action :authenticate_sales_employee!
end
