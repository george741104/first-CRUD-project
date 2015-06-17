class EventsController < ApplicationController

before_action :set_event, :only => [ :show, :edit, :update, :destroy]

#GET /events
#GET /events/index
  def index
    #@events = Event.all
    @events = Event.page(params[:page]).per(20)

    if params[:eid]
      @event = Event.find( params[:eid] )
    else
      @event = Event.new

    end

    prepare_variable_for_index_template
    respond_to do |format|
      format.html
      format.xml { render :xml => @events.to_xml }
      format.json { render :json => @events.to_json }
      format.atom { @feed_title = "My event list" } # index.atom.builder
    end
  end


#GET /events/new
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

#GET /events/latest
  def latest
    @events = Event.order("id DESC").limit(3)
  end

#POST /event/bulk_update
def bulk_update
  ids = Array(params[:ids])
    events = ids.map{ |i| Event.find_by_id(i) }.compact

    if params[:commit] == "Publish"
      events.each{ |e| e.update( :status => "published" ) }
    elsif params[:commit] == "Delete"
      events.each{ |e| e.destroy }
    end
  redirect_to :back
end



#GET /events/show/:id
  def show

    @page_title = @event.name

    respond_to do |format|
      format.html { @page_title = @event.name } # show.html.erb
      format.xml # show.xml.builder
      format.json { render :json => { id: @event.id, name: @event.name }.to_json }
    end
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
      prepare_variable_for_index_template

      render :action => :index
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
    params.require(:event).permit(:name, :description,:status, :category_id,
                                  :group_ids=>[] )
  end
  def prepare_variable_for_index_template
  @events = Event.page( params[:page] ).per(10)
  end

end
