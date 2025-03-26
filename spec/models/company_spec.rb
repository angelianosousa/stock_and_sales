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
require 'rails_helper'

RSpec.describe Company, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
