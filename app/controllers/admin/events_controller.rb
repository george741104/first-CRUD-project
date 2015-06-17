class Admin::EventsController < ApplicationController
  layout "admin"
  def index
    @events = Event.all
  end

end
