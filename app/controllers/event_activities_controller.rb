class EventActivitiesController < ApplicationController
  before_action :authorize

  def authorize
    if session[:user_id].blank?
      redirect_to root_url, notice: "Not Authorized"
    end
  end

  def destroy
    @event_activity=EventActivity.find_by(id: params[:id])
    @event=Event.find_by(id:@event_activity.event_id)
    # activity_id = @event_activity.activity_id
    @event_activity.destroy
    # activity_count=EventActivity.where(activity_id:@event_activity.activity_id).count()
    # if activity_count==0
    #   @activity=Activity.find_by(id:activity_id)
    #   @activity.delete
    # end
    redirect_to event_url(@event)
  end
end
