class Event < ActiveRecord::Base

    validates_presence_of :name
    has_many :attendees
    has_one :location
    has_many :event_groupships
    has_many :goups, :through => :event_groupships
end
