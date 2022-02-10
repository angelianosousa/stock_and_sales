module CategoriesHelper
  def category_for_select
    Category.all.collect { |c| [c.title, c.id] }
  end
end
