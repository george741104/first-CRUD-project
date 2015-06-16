class Attendee < ActiveRecord::Base
      validates_presence_of :name
      has_many :attendees,
end
 class Attendee < ActiveRecord::Base
  belongs_to :event

end

