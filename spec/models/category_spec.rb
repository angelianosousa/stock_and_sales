require "rails_helper"

RSpec.describe Category, type: :model do
  it "tem um titulo" do
    title = Faker::Job.field
    category = Category.create!(title: title)

    expect(category.title).to eq(title)
  end 
end
