class Product < ApplicationRecord
  # Callbacks
  before_save :generate_product_code

  # Associations
  belongs_to :category, counter_cache: true
  has_many :sales, dependent: :destroy

  # Validations
  validates :title, uniqueness: true, presence: true
  validates :price_unitary, :in_stock, :safety_margin, presence: true

  paginates_per 10

  def generate_product_code
    self.product_code = rand(12345678..99999999)
  end

  scope :_search_product_code_, -> (product_code, page) { 
    where(product_code: product_code).includes(:category).page(page)
  }
end
