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
require "rails_helper"

RSpec.describe Category, type: :model do
  it "tem um titulo" do
    title = Faker::Job.field
    category = Category.create!(title: title)

    expect(category.title).to eq(title)
  end 
end
