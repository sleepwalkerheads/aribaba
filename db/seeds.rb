# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


# return if Rails.env != "development"


max_cards = 100
max_users = 10

users = []
cards = []



p 'MASTER USER'
p '----------------------------------------'

master = User.create(
  :username => "aribaba",
  :email => "shimizu.motoi@gmail.com",
  :password => 'iamasdsp',
  :password_confirmation => 'iamasdsp')
  
master.save  
p "created: (master user) ........\n"


p 'creating dummy users.....................'
0.upto(max_users) do |n|
  
  username = Faker::Internet.user_name
  email = Faker::Internet.email
  password = 'iamasdsp00'
  
  u = User.create(
    :username => username,
    :email => email,
    :password => password,
    :password_confirmation => password)
  u.save
  p "created: User #{n}, [username]#{username}, [emal]#{email}"
end


p '\ncreating dummy cards.....................'
1.upto(max_cards) do |n|

  player_name = Faker::Name.first_name
  game_title = Faker::Name.title
  character = (n%2==0) ? Faker::Name.name : ""
  comment = (n%4==0) ? Faker::Lorem.sentence : ""
  latitude = 35.35881619143943 + rand(3)
  longitude = 136.614990234375 + rand(3)
  active = (rand(2)%2==0)
  user_id = rand(max_users).round+1
  
  c = Card.create(
    :player_name => player_name,
    :game_title => game_title,
    :character => character,
    :comment => comment,
    :latitude => latitude,
    :longitude => longitude,
    :active => active,
    :user_id => user_id)
  
  c.save!(:validate => false)
  p "created: Card #{n}, belongs to #{user_id}, [player_name]#{player_name}, [game_title]#{game_title}"
end