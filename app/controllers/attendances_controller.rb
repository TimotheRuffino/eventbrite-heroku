class AttendancesController < ApplicationController
  include EventsHelper
  def index
    @attendances = Attendance.all
end

def new
  
  @attendances = Attendance.new
  @events = Event.all
  #@attendances = Attendance.find(params[:id])
  #@event_att = Attendance.find(params[:id]).events
end

def create
  @attendances = Attendance.new(attendance_params)
  
  if @attendances.save
    flash[:success] = "Your attendance has been created."
    redirect_to event_path(@events.id)
  else
    messages = []
    if @attendances.errors.any? 
      @attendances.errors.full_messages.each do |message| 
        messages << message
      end 
      flash[:error] = "You failed, find the following errors :#{messages.join(" ")}"
      render 'new'
    end
  end
end

private

  def attendance_params
    params.require(:attendances).permit(:event_id, :user_id)
  end




end
