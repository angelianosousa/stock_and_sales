# == Schema Information
#
# Table name: categories
#
#  id             :bigint           not null, primary key
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  products_count :integer          default(0)
#  sales_count    :integer          default(0)
#
class Category < ApplicationRecord
  paginates_per 10
  validates :title, uniqueness: true, presence: true

  has_many :products, dependent: :destroy

  scope :_search_category_, -> (title, page) { 
    where("lower(title) LIKE ?", "%#{title.downcase}%").page(page)
  }
end
