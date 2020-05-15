class EventsController < ApplicationController

def index
  @events = Event.all
end 

def show
  @events = Event.find(params[:id])
end 

def new
  @events = Event.new
end 

def create
  @events = Event.new(event_params)
  puts @events.title
  if @events.save
    flash[:success] = "Votre évènement vient d'être créé ! "
    redirect_to event_path(@events.id)
  else
    messages = []
    if @events.errors.any? 
      @events.errors.full_messages.each do |message| 
        messages << message
      end 
      flash[:error] = "Votre évènement n'a pas pu être créé pour les raisons suivantes : #{messages.join(" ")}"
      render 'new'
    end
  end
end

private

def event_update
  params.require(:events).permit(:title, :location, :duration, :description, :price, :start_date, :admin_id)
end

def event_params
params.require(:events).permit(:title, :location, :duration, :description, :price, :start_date, :admin_id)
end

def update 
  @events = Event.find(params[:id])
  if @events.update(event_update)
    redirect_to event_path
  else
    render edit_event_path
  end
end

end
     
