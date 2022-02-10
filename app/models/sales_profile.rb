class SalesProfile < ApplicationRecord
  belongs_to :sales_employee
  has_many :sales, dependent: :destroy
end
