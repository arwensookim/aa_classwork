# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all 

sennacy = Cat.create(name: 'Sennacy', birth_date: '2021/08/01', color: 'brown', sex: 'F', descrition: 'first cat')
peaches = Cat.create(name: 'Peaches', birth_date: '2020/12/15', color: 'pink', sex: 'F')
garfield = Cat.create(name: 'Garfield', birth_date: '2002/10/05', color: 'orange', sex: 'M', descrition: 'oldest cat')

