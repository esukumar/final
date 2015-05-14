require 'date'
Event.delete_all
Note.delete_all
Event.create(title:'Chicago Cubs Game', picture:'http://lakeshorepublicmedia.org/wp-content/uploads/2013/07/Wrigley.jpg')
Event.create(title:'San Francisco Trip', picture:'http://www.babson.edu/Academics/undergraduate/academic-programs/PublishingImages/san-franc.jpg')
Event.create(title:'Croatia Backpacking', picture:'http://www.lonelyplanet.com/maps/europe/croatia/map_of_croatia.jpg')
Note.create(title:'The 5th inning',desc:'The batter hit a home run and the crowd went wild!!',event_id:Event.find_by(title:'Chicago Cubs Game').id)
Note.create(title:'Fireworks',desc:'After the game, fireworks lit up the sky.',event_id:Event.find_by(title:'Chicago Cubs Game').id)
Note.create(title:'Alcatraz',desc:'We toured Alcatraz island and saw the barren prison cells',event_id:Event.find_by(title:'San Francisco Trip').id)
Note.create(title:'Dubrovnik',desc:'This rustic old city was one of the major film sites for Game of Thrones',event_id:Event.find_by(title:'Croatia Backpacking').id)
Note.create(title:'Hvar Island',desc:'Celebrities from around the world flock here for the nightlife',event_id:Event.find_by(title:'Croatia Backpacking').id)

# Note.create(title:'Sears Tower', time:DateTime.now, desc:'It was a great view from the top')
puts "#{Event.count} Events Seeded succesfully."
puts "#{Note.count} Notes Seeded succesfully."
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
