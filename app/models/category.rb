class Category < ApplicationRecord
  paginates_per 10
  validates :title, uniqueness: true, presence: true

  has_many :products, dependent: :destroy

  scope :_search_category_, -> (title, page) { 
    where("lower(title) LIKE ?", "%#{title.downcase}%").page(page)
  }
end
