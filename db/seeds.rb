# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# テストデータ一個生成
# Task.create(content: 'test content 1', status: 'test status 1')

# テストデータ１００件生成
(1..100).each do |number|
  Task.create(status: 'test status ' + number.to_s, content: 'test content ' + number.to_s)
end
