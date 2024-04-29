# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  category_id    :bigint
#  product_code   :string           not null
#  company        :string
#  model          :string
#  title          :string
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("BRL"), not null
#  in_stock       :integer          default(0)
#  safety_margin  :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Product < ApplicationRecord

  # Callbacks
  before_save :generate_product_code

  # Associations
  belongs_to :category, counter_cache: true
  
  has_many :sales_items
  has_one_attached :picture

  has_one_attached :picture do |attachable|
    attachable.variant :store, resize: "100x100"
  end

  # Validations
  validates :title, presence: true
  validates :price, :in_stock, :safety_margin, presence: true
  monetize :price_cents

  # TODO Validations if has any product on sale

  paginates_per 10

  def generate_product_code
    self.product_code = rand(12_345_678..99_999_999)
  end

  default_scope { order(updated_at: :desc )}

  scope :with_stock, -> { where('in_stock > ?', 0) }
end
