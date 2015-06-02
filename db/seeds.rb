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
Event.create(title:'Tomorrowland',picture:'http://fc03.deviantart.net/fs70/f/2014/333/5/2/tomorrowland_2_by_omerfk360-d8823q0.jpg', user_id:User.find_by(email:'root@example.com').id)
Event.create(title:'Greek Islands',picture:'http://www.telegraph.co.uk/incoming/article72232.ece/ALTERNATES/w620/santorini.jpg', user_id:User.find_by(email:'root@example.com').id)
Event.create(title:'London Visit',picture:'http://www.clinkhostels.com/wp-content/uploads/2015/03/london22.jpg', user_id:User.find_by(email:'root@example.com').id)

Activity.create(title: 'Hiking')
Activity.create(title: 'Spectating')
Activity.create(title: 'Sunbathing')
Activity.create(title: 'Snorkeling')
Activity.create(title: 'Museums')
Activity.create(title: 'Techno')

EventActivity.create(event_id:Event.find_by(title:'San Francisco Trip').id,activity_id:Activity.find_by(title:'Hiking').id)
EventActivity.create(event_id:Event.find_by(title:'Croatia Backpacking').id,activity_id:Activity.find_by(title:'Hiking').id)
EventActivity.create(event_id:Event.find_by(title:'Chicago Cubs Game').id,activity_id:Activity.find_by(title:'Spectating').id)
EventActivity.create(event_id:Event.find_by(title:'Greek Islands').id,activity_id:Activity.find_by(title:'Sunbathing').id)
EventActivity.create(event_id:Event.find_by(title:'Croatia Backpacking').id,activity_id:Activity.find_by(title:'Snorkeling').id)
EventActivity.create(event_id:Event.find_by(title:'Greek Islands').id,activity_id:Activity.find_by(title:'Snorkeling').id)
EventActivity.create(event_id:Event.find_by(title:'London Visit').id,activity_id:Activity.find_by(title:'Museums').id)
EventActivity.create(event_id:Event.find_by(title:'Tomorrowland').id,activity_id:Activity.find_by(title:'Techno').id)

Note.create(title:'The 5th inning',desc:'The batter hit a home run and the crowd went wild!!',event_id:Event.find_by(title:'Chicago Cubs Game').id)
Image.create(title: 'Home Base',picture:'http://wrigleyivy.com/wp-content/uploads/2013/02/wrigly_field_espn.jpg',event_id:Event.find_by(title:'Chicago Cubs Game').id)
Note.create(title:'Fireworks',desc:'After the game, fireworks lit up the sky.',event_id:Event.find_by(title:'Chicago Cubs Game').id)

Note.create(title:'Alcatraz Tour',desc:'We toured Alcatraz island and saw the barren prison cells',event_id:Event.find_by(title:'San Francisco Trip').id)
Image.create(title:'Alcatraz Pic',picture:'http://upload.wikimedia.org/wikipedia/commons/0/0a/Alcatraz_Island_photo_D_Ramey_Logan.jpg',event_id:Event.find_by(title:'San Francisco Trip').id)

Note.create(title:'Dubrovnik',desc:'This rustic old city was one of the major film sites for Game of Thrones',event_id:Event.find_by(title:'Croatia Backpacking').id)
Note.create(title:'Hvar Island',desc:'Celebrities from around the world flock here for the nightlife',event_id:Event.find_by(title:'Croatia Backpacking').id)

Note.create(title:'Santorini',desc:'There was a magnificent view from the rooftop restaurant',event_id:Event.find_by(title:'Greek Islands').id)

Note.create(title:'Museum',desc:'We saw all of the crown jewels and medieval armor at the museum.',event_id:Event.find_by(title:'London Visit').id)

Note.create(title:'DubStep',desc:'Our favorite artists dropped the bass at the dubstep stage.',event_id:Event.find_by(title:'Tomorrowland').id)

puts "#{User.count} Users Seeded succesfully."
puts "#{Event.count} Events Seeded succesfully."
puts "#{Activity.count} Activities Seeded succesfully."
puts "#{Note.count} Notes Seeded succesfully."
puts "#{Image.count} Images Seeded succesfully."