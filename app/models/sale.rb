class Sale < ApplicationRecord
  before_save :generate_sales_code
  belongs_to :sales_profile
  belongs_to :product

  paginates_per 10

  def generate_sales_code
    self.sales_code = rand(12345678..99999999)
  end

  scope :_search_sales_, -> (sales_code, page) { 
    where("sales_code = ?", sales_code).page(page)
  }
end
