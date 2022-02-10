class SalesEmployee < ApplicationRecord
  after_save :set_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :sales_profile

  def set_profile
    SalesProfile.create(sales_employee_id: SalesEmployee.last.id)
  end
end
