class EventsController < ApplicationController
#get /events
# get /events/index
      def index
            @events = Event.all
      end

#get /events/new
      def new
            @event= Event.new
      end
#POST /events/create
      def create
        @event = Event.new(event_params)
        @event.save

        redirect_to :action => :index
      end

#GET /events/show/:id
      def show
            @event = Event.find( params[:id] )
      end
#GET /events/edit/:id
      def edit
            @event = Event.find (params[:id] )
      end
#POST /events/edit/update/:id
      def update
            @event = Event.find (params[:id])

            @event.update (event_params)
             redirect_to :action => :show, :id => @event
      end
#GET /events/destroy/:id
      def destroy
             @event = Event.find(params[:id])
              @event.destroy

               redirect_to :action => :index
      end




      private

      def event_params
        params.require(:event).permit(:name, :description)
      end

end
