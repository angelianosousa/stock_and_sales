module CategoriesHelper
  def category_for_select
    current_company.categories.map { |c| [c.name, c.id] }
  end
end
