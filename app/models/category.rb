# == Schema Information
#
# Table name: categories
#
#  id             :bigint           not null, primary key
#  name           :string
#  company_id     :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  products_count :integer          default(0)
#  sales_count    :integer          default(0)
#
class Category < ApplicationRecord
  paginates_per 10
  validates :name, uniqueness: true, presence: true

  has_many :products, dependent: :destroy
end
