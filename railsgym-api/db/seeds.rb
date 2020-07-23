# 技術一覧の作成
category_list = ['HTML&CSS', 'Ruby', 'Rails', 'RSpec', 'Git', 'AWS', 'Docker', 'SQL', 'デザイン', '設計']
category_list.each do |category_name|
  Category.create(name: category_name)
end

category_ruby = Category.find_by(name: 'Ruby')
category_ruby.items.create(
  title: 'プロを目指す人のためのRuby入門',
  url: 'https://www.amazon.co.jp/%E3%83%97%E3%83%AD%E3%82%92%E7%9B%AE%E6%8C%87%E3%81%99%E4%BA%BA%E3%81%AE%E3%81%9F%E3%82%81%E3%81%AERuby%E5%85%A5%E9%96%80-%E8%A8%80%E8%AA%9E%E4%BB%95%E6%A7%98%E3%81%8B%E3%82%89%E3%83%86%E3%82%B9%E3%83%88%E9%A7%86%E5%8B%95%E9%96%8B%E7%99%BA%E3%83%BB%E3%83%87%E3%83%90%E3%83%83%E3%82%B0%E6%8A%80%E6%B3%95%E3%81%BE%E3%81%A7-Software-Design-plus%E3%82%B7%E3%83%AA%E3%83%BC%E3%82%BA/dp/4774193976'
)

category_html = Category.find_by(name: 'HTML&CSS')
category_html.items.create(
  title: '1冊ですべて身につくHTML & CSSとWebデザイン入門講座',
  url: 'https://www.amazon.co.jp/1%E5%86%8A%E3%81%A7%E3%81%99%E3%81%B9%E3%81%A6%E8%BA%AB%E3%81%AB%E3%81%A4%E3%81%8FHTML-CSS%E3%81%A8Web%E3%83%87%E3%82%B6%E3%82%A4%E3%83%B3%E5%85%A5%E9%96%80%E8%AC%9B%E5%BA%A7-Mana/dp/4797398892'
)

category_git = Category.find_by(name: 'Git')
category_git.items.create(
  title: 'わかばちゃんと学ぶ Git使い方入門',
  url: 'https://www.amazon.co.jp/%E3%82%8F%E3%81%8B%E3%81%B0%E3%81%A1%E3%82%83%E3%82%93%E3%81%A8%E5%AD%A6%E3%81%B6-Git%E4%BD%BF%E3%81%84%E6%96%B9%E5%85%A5%E9%96%80%E3%80%88GitHub%E3%80%81Bitbucket%E3%80%81SourceTree%E3%80%89-%E6%B9%8A%E5%B7%9D-%E3%81%82%E3%81%84/dp/4863542178'
)

category_design = Category.find_by(name: 'デザイン')
category_design.items.create(
  title: 'stories',
  url: 'https://stories.freepik.com/'
)