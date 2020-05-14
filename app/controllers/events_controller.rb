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
    @event = Event.new(title: params[:title], location: params[:location], price: params[:price], description: params[:description], start_date: params[:start_date], duration: params[:duration], admin: current_user)

    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to root_path
    else
      flash[:failure] = "Invalid input"
      render :new
    end
  end

end
     
