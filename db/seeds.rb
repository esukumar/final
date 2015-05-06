require 'date'
Event.delete_all
Note.delete_all
Event.create(title:'Chicago Cubs Game', picture:'http://lakeshorepublicmedia.org/wp-content/uploads/2013/07/Wrigley.jpg')
# Note.create(title:'Sears Tower', time:DateTime.now, desc:'It was a great view from the top')
puts "#{Event.count} Seeded succesfully."
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
