namespace :data do
  task :demo => :environment do
    puts "demo!!"
    puts Event.count
  end

  task :rebuild => ["db:reset", :fake]
  #task :rebuild => ["db:drop","db:setup", :fake]

  task :fake => :environment do
    User.delete_all
    Event.delete_all
    Attendee.delete_all

    puts "creating fake data!"

    user = User.create!( :email => "ihower@gmail.com", :password =>"12345678")
    50.times do |i|
      e = Event.create( :name => Faker::App.name, :description => Faker::Lorem.paragraph(3))
      50.times do |j|
        e.attendees.create(:name => Faker::Name.name)
      end
    end
  end
end
