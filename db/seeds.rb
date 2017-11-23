# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    OrderStatus.delete_all
    OrderStatus.create!(:title => 'In progress')
    OrderStatus.create!(:title => 'Shiping')
    OrderStatus.create!(:title => 'Canceled')
    OrderStatus.create!(:title => 'Completed')
  
    Admin.delete_all
    Admin.create!(:email => 'dimension18@mail.ru', :password => '12345678')

    Category.delete_all
    Category.create!(:title => 'Пицца',:seo_url => 'pizza')
    