# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create 10 standard users
for i in 1..10
  user = User.new(
    :email => Faker::Internet.email,
    :password => '123456',
    :file_id => rand(1..2)
    :admin => false
  )
  user.save!(:validate => false)
  Puts "Created #{i} users"
end

# Create 1 admin user
admin_user = User.new(
    :email => Faker::Internet.email,
    :password => '123456',
    :file_id => rand(1..2)
    :admin => true
  )
  admin_user.save!(:validate => false)
  Puts "Created one admin user"




# for i in 1..18
#   Manufacturer.create(
#     name: Faker::Company.name,
#     location: Faker::Address.city
#   )
# end 


# for i in 1..20
#   Toy.create(
#     name: Faker::Superhero.power,
#     description: Faker::Lorem.sentence,
#     date_posted: Faker::Date.between( from: 200.days.ago, to: Date.today ),
#     user_id: (1..18).to_a.sample,
#     manufacturer_id: (1..18).to_a.sample
#   )
#   puts "Created #{i} records"
# end 


#### LISTINGS TABLE ##############

### Title - make 20
# Excellent laptop, Excellent computer, Distinguished Dell, Awesome Acer laptop, Great condition laptop, Great condition desktop, Almost new computer, Almost new laptop, Amazing Apple, 


### Description - make 20
## Hardly used tech, works like a gem. 
## Much loved and reliable computer. You want it, you got it! 
## A beautiful and reliable laptop.
## Fast and reliable. This has been a much loved computer.
## Lightweight and like new piece of tech. 
## 


### data_wiped
### Yes No (or true and false)


### location

# location_list = [
  
#   [ "Adelaide, SA" ],
#   [ "Brisbane, QLD" ],
#   [ "Canberra, ACT" ],
#   [ "Hobart, Tas" ],
#   [ "Melbourne, Vic" ],
#   [ "Perth, WA" ],
#   [ "Sydney, NSW"  ],
#   [ "Darwin, NT" ]
# ]

# location_list.each do |name|
#   Listing.create( location: name )
# end


######### OTHER TABLES ###############


##### Conditions #### 
## New Used



##### Machine table
# machine_list = [
#   [ "OSX" ],
#   [ "Windows" ],
#   [ "Other" ]
# ]

# machine_list.each do |tech|
#   Machine.create( tech: tech )


### Systems table
### System
### OSX Windows Other


### Years table
## 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 


#### Donations
for i in 1..20
  Donation.create (
    name: Faker::Name.name,
    amount: (1..100).to_a.sample
  )
    puts "created #{i} records"
end 
  

