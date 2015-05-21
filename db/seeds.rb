# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
User.delete_all
Event.delete_all
Activity.delete_all
EventActivity.delete_all
Note.delete_all
Image.delete_all


User.create(email: 'root@example.com', password: 'foo', name:'root')

Event.create(title:'Chicago Cubs Game', picture:'http://lakeshorepublicmedia.org/wp-content/uploads/2013/07/Wrigley.jpg', user_id:User.find_by(email:'root@example.com').id)
Event.create(title:'San Francisco Trip', picture:'http://www.babson.edu/Academics/undergraduate/academic-programs/PublishingImages/san-franc.jpg', user_id:User.find_by(email:'root@example.com').id)
Event.create(title:'Croatia Backpacking', picture:'http://www.lonelyplanet.com/maps/europe/croatia/map_of_croatia.jpg', user_id:User.find_by(email:'root@example.com').id)

Activity.create(title: 'Hiking')

EventActivity.create(event_id:Event.find_by(title:'San Francisco Trip').id,activity_id:Activity.find_by(title:'Hiking').id)
EventActivity.create(event_id:Event.find_by(title:'Croatia Backpacking').id,activity_id:Activity.find_by(title:'Hiking').id)

Note.create(title:'The 5th inning',desc:'The batter hit a home run and the crowd went wild!!',event_id:Event.find_by(title:'Chicago Cubs Game').id)
Image.create(title: 'Home Base',picture:'http://wrigleyivy.com/wp-content/uploads/2013/02/wrigly_field_espn.jpg',event_id:Event.find_by(title:'Chicago Cubs Game').id)
Note.create(title:'Fireworks',desc:'After the game, fireworks lit up the sky.',event_id:Event.find_by(title:'Chicago Cubs Game').id)

Note.create(title:'Alcatraz Tour',desc:'We toured Alcatraz island and saw the barren prison cells',event_id:Event.find_by(title:'San Francisco Trip').id)
Image.create(title:'Alcatraz Pic',picture:'http://upload.wikimedia.org/wikipedia/commons/0/0a/Alcatraz_Island_photo_D_Ramey_Logan.jpg',event_id:Event.find_by(title:'San Francisco Trip').id)

Note.create(title:'Dubrovnik',desc:'This rustic old city was one of the major film sites for Game of Thrones',event_id:Event.find_by(title:'Croatia Backpacking').id)
Note.create(title:'Hvar Island',desc:'Celebrities from around the world flock here for the nightlife',event_id:Event.find_by(title:'Croatia Backpacking').id)

puts "#{User.count} Users Seeded succesfully."
puts "#{Event.count} Events Seeded succesfully."
puts "#{Activity.count} Activities Seeded succesfully."
puts "#{Note.count} Notes Seeded succesfully."
puts "#{Image.count} Images Seeded succesfully."