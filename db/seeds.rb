# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'ROLES'
 	Role.find_or_create_by_name({ :name => 'admin' }, :without_protection => true)
 	Role.find_or_create_by_name({ :name => 'author' }, :without_protection => true)
 	Role.find_or_create_by_name({ :name => 'user' }, :without_protection => true)
puts 'Default User'
user = User.find_or_create_by_email :email => 'sagar.patil.smp@gmail.com', :password => '12345678', :password_confirmation => '12345678' 	
user.confirm!
user.add_role :admin