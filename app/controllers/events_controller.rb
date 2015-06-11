class EventsController < ApplicationController

before_action :set_event, :only => [ :show, :edit, :update, :destroy]

#get /events
# get /events/index
      def index
            #@events = Event.all
            @events = Event.page(params[:page]).per(20)
      end

#get /events/new
      def new
            @event= Event.new
      end
#POST /events/create
      def create
        @event = Event.new(event_params)
            if @event.save   #if the input passed the data validation
              flash[:notice] = "event was successfully created"
              redirect_to events_path
            else
            render :action => :new #otherwise, show the error msg to user
      end
      end

#GET /events/show/:id
      def show

            @page_title = @event.name
      end
#GET /events/edit/:id
      def edit

      end
#POST /events/edit/update/:id
      def update


            if @event.update (event_params) # if successfully updated the data
               flash[:notice] = "event was successfully updated"
               redirect_to event_path(@event)
            else
              render :action => :edit
            end
      end
#GET /events/destroy/:id
      def destroy

              @event.destroy
              flash[:alert] = "event was successfully deleted"
               redirect_to events_path
      end




      private
      def set_event
        @event = Event.find(params[:id])
      end
      def event_params
        params.require(:event).permit(:name, :description)
      end

end
