class Event < ActiveRecord::Base

    validates_presence_of :name

    has_many :attendees, :dependent => :destroy #Attendees would be deleted as well when destroying event.

    has_many :attendees, -> {where(['created_at > ?', Time.now - 7.day]).order("id DESC")}
    has_many :attendees, ->{ order("id DESC")}
    has_one :location

    has_many :event_groupships

    has_many :groups, :through => :event_groupships

    has_many :attendees, -> {where(['created_at > ?', Time.now - 7.day]).order("id DESC")}
    belongs_to :category

    delegate :name, :to => :category, :prefix => true, :allow_nil => true
end
