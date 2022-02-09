class Sale < ApplicationRecord
  belongs_to :sales_employee
  belongs_to :product
end
