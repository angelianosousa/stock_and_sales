# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  name        :string
#  cpf_cnpj    :string
#  person_type :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Company < ApplicationRecord
  enum person_type: %i[cpf cnpj]

  # Associations
  has_many :products, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :sales_employees, dependent: :destroy

  has_one_attached :logo do |attachable|
    attachable.variant :icon, resize: "100x100"
  end

  validates :name, :cpf_cnpj, presence: true
  validate :validate_person_type

  def validate_person_type
    return unless cpf_cnpj.present?

    result = person_type == Company.person_types[:cpf] ? CPF.valid?(cpf_cnpj) : CNPJ.valid?(cpf_cnpj)

    errors.add :cpf_cnpj, :invalid unless result
  end

  def cpf_cnpj_formatted
    tipo_pessoa == Company.person_types[:cpf] ? CPF.format(cpf_cnpj) : CNPJ.format(cpf_cnpj)
  end

end
