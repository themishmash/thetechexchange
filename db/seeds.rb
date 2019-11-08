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
    :password => '123456'
  )
  user.save!(:validate => false)
  puts "Created #{i} users"
end

# Create 1 admin user
admin_user = User.new(
    :email => "wong.mich.c@gmail.com",
    :password => '123456',
    :admin => true
  )
  admin_user.save!(:validate => false)
  puts "Created one admin user"


#### 20 Donations created
for i in 1..20
  Donation.create(
    name: Faker::Name.name,
    amount: (1..100).to_a.sample
  )
    puts "created #{i} records"
end 


#### Data for listings
titles = ["Excellent laptop", "Excellent computer", "Distinguished Dell", "Awesome Acer laptop", "Great condition laptop", "Great condition desktop", "Almost new computer", "Almost new laptop", "Amazing Apple"]

descriptions = ["Hardly used tech, works like a gem.", 
"Much loved and reliable computer. You want it, you got it!", 
"A beautiful and reliable laptop.", 
"Fast and reliable. This has been a much loved computer.", 
"Lightweight and like new piece of tech." ]

years = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019]


### creating new conditions
conditions = ["New", "Used"]

conditions.each do |condition|
  Condition.create!(
    condition: condition
  )
end

datawiped = [true, false]


### creating new machines
machines = ["Computer", "Laptop", "Tablet" ]

machines.each do |machine|
  Machine.create!(
    name: machine
  )
end

locations = ["Adelaide, SA", "Brisbane, QLD", "Canberra, ACT" , "Hobart, Tas", "Melbourne, Vic", "Perth, WA", "Sydney, NSW", "Darwin, NT"] 

#### creating new years
for i in 0..19
Year.create!(
  name: years[i],
)
end

#### creating new systems
systems = ["OSX", "Windows", "Other" ]
systems.each do |system|
  System.create!(
    name: system
  )
end

#### creating 20 listings
for i in 1..20
  listing = Listing.create!(
    user_id: User.find(rand(1..10)).id,
    title: titles.sample,
    description: descriptions.sample,
    system_id: System.find(rand(1..3)).id,
    year_id: Year.find(rand(1..20)).id,
    condition_id: Condition.find(rand(1..2)).id,
    data_wiped: datawiped.sample,
    machine_id: Machine.find(rand(1..3)).id,
    location: locations.sample
   )
  #### Pictures attached to listings
   listing.picture.attach(io: File.open("app/assets/images/tech/#{rand(1..9)}.jpg"), filename: "1.jpg")
  listing.save
end






