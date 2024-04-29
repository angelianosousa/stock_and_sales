# == Schema Information
#
# Table name: sales_profiles
#
#  id                :bigint           not null, primary key
#  sales_employee_id :bigint
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class SalesProfile < ApplicationRecord
  belongs_to :sales_employee
  has_many :sales, dependent: :destroy
end
