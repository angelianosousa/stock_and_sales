class SalesEmployee < ApplicationRecord
  after_save :set_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_profile
    SalesEmployeeProfile.create(sales_employee_id: self.id)
  end
end
