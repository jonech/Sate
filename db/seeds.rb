# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Events = Event.create([
    { name: 'Food Truck Festival',
      place: '501, Swanston Street',
      description: 'Good food awaits',
      end_time: '7.30 am',
      organisation: 'Youth Charity',
      like: 10,
      lat: 10000,
      long: 10000,
      imageurl: 'http://wallpapershome.com/images/pages/pic_h/8017.jpg',
      org_link: 'http://google.com'}
    ])
