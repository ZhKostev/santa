# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
GiftGrantor.delete_all
['Вадим', 'Дина', 'Юля', 'Костев', 'Дима Е.', 'Саша Р.', 'Дима М.', 'Саша О.', 'Аня', 'Марина Т.', 'Сергей', 'Рома',
 'Настя', 'Наташа', 'Саша К.'].each do |name|
  GiftGrantor.create!(:recipient => name)
end
Quote.delete_all
[
  'Come, gentlemen, I hope we shall drink down all unkindness. <br/> <b>William Shakespeare</b>',
  'The new year stands before us, like a chapter in a book, waiting to be written. We can help write that story by setting goals. <br/> <b>Melody Beattie</b>',
  'I never worry about being driven to drink; I just worry about being driven home.<br/><b>W. C. Fields</b>',
  'I believe that if life gives you lemons, you should make lemonade... And try to find somebody whose life has given them vodka, and have a party.<br/><b>Ron White</b>',
  'Wine is constant proof that God loves us and loves to see us happy.<br/><b>Benjamin Franklin</b>',
  "If you're going to do something tonight that you'll be sorry for tomorrow morning, sleep late.<br/><b>Henny Youngman</b>",
  "Go to Heaven for the climate, Hell for the company.<br/><b>Mark Twain</b>"
].each do |quote_body|
  Quote.create!(:body => quote_body)
end
