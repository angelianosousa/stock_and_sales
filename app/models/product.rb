class Product < ApplicationRecord
  belongs_to :category
  has_many :sales, dependent: :destroy

  validates :title, :price_unitary, :in_stock, :safety_margin, presence: true

  paginates_per 10
end
