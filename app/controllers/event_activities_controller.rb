class EventActivitiesController < ApplicationController
  def destroy
    @event_activity=EventActivity.find_by(id: params[:id])
    @event=Event.find_by(id:@event_activity.event_id)
    @event_activity.delete
    redirect_to event_url(@event)
  end
end
