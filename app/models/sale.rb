class Sale < ApplicationRecord
  belongs_to :sales_profile
  belongs_to :product

  paginates_per 10
end
