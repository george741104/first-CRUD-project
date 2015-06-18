# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!( :name => 'Conference')
Category.create!( :name => 'Meeting')
Category.create!( :name => 'BallGame')
Category.create!( :name => 'Competition')

Group.create!( :name => "Ruby")
Group.create!( :name => "Java")
Group.create!( :name => "Rails")
Group.create!( :name => "HTML")

