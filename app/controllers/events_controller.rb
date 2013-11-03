class EventsController < ApplicationController
  before_action :signed_in_employee, only: [:create, :destroy]
  def index

  end
  def create
   @event = current_employee.events.build(event_params)
   if @event.save
    redirect_to root_path
   else
     render 'pages/blog'
   end
   end
  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_url
  end
  private
  def event_params
    params.require(:event).permit(:event_name, :start_time)
  end
end
