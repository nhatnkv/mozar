root_categories = ["Shoes", "T-Shirt", "Jean", "Vest"]

puts "Creating root category"
Category.destroy_all
root_categories.each do |category|
  Category.create(name: category)
end


puts "Creating category"
Category.where(level: 1).each do |category|
  root_categories.each do |name|
    Category.create(name: "#{name}_small", parent_id: category.id)
  end
end

puts "Create medium category"
categories_50_first = Category.where(level: 3).limit(10)
categories_last = Category.where(level: 3).where.not(id: categories_50_first.pluck(:id))

categories_last.each do |category_last|
  categories_50_first.each do |category_medium|
    category_last.update(parent_id: category_medium.id)
    category_medium.update(name: "#{root_categories.sample}_medium")
  end
end