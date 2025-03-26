# == Schema Information
#
# Table name: sales
#
#  id                   :bigint           not null, primary key
#  company_id           :bigint
#  sales_employee_id    :bigint
#  client_name          :string           not null
#  saled_at             :datetime
#  total_price_cents    :integer          default(0), not null
#  total_price_currency :string           default("BRL"), not null
#  status               :integer          default("open")
#  payment_method       :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Sale < ApplicationRecord
  enum status: %i[open paid]
  enum payment_method: %i[money debt_card credit_card]

  belongs_to :company
  has_many :sale_items, dependent: :destroy

  validates :client_name, presence: true
  monetize :total_price_cents

  accepts_nested_attributes_for :sale_items, reject_if: :all_blank, allow_destroy: true

  paginates_per 10
end
