class Sale < ApplicationRecord
  before_save :generate_sales_code
  belongs_to :sales_profile
  has_many :products

  accepts_nested_attributes_for :products, allow_destroy: true

  paginates_per 10

  def generate_sales_code
    self.sales_code = rand(12_345_678..99_999_999).to_s
  end

  scope :_search_sales_, -> (sales_profile, sales_code, page) { 
    where("sales_profile_id = ? and sales_code = ?", sales_profile.id, sales_code).includes(:product => :category).page(page)
  }
end
