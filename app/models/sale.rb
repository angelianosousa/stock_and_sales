class Sale < ApplicationRecord
  before_save :make_total_price
  belongs_to :sales_profile
  has_many :sale_items, dependent: :destroy

  validates :client_name, :total_price, presence: true

  accepts_nested_attributes_for :sale_items, reject_if: :all_blank, allow_destroy: true

  paginates_per 10

  scope :_search_sales_, -> (sales_profile, sales_code, page) { 
    where("sales_profile_id = ? and sales_code = ?", sales_profile.id, sales_code).page(page)
  }

  def make_total_price
    self.sale_items.each do |item|
      self.total_price += item.product.price
    end
  end
end
