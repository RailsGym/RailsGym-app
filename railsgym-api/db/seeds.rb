# 技術一覧の作成
category_list = ['HTML&CSS', 'Ruby', 'rails', 'RSpec', 'Git', 'AWS', 'Docker', 'SQL', 'デザイン', '設計']
category_list.each do |category_name|
  Category.create!(name: category_name)
end