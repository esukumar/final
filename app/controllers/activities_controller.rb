class ActivitiesController < ApplicationController
  def index
    @activities = Activity.order('title asc')
  end

  def show
    @activity = Activity.find_by(id: params[:id])
    if @activity == nil
      redirect_to activities_url, notice: "Activity not found"
    else
      @events = @activity.events
    end
  end

  def new
    @event=Event.find_by(id: params[:event_id])
    @activity = Activity.new
  end

  def create
    @event=Event.find_by(id: params[:event_id])
    if Activity.exists?(title: params[:title])
      @activity=Activity.find_by(title: params[:title])
    else
      @activity = Activity.new
      @activity.title = params[:title]
    end
    if @activity.save
      @event_activity = EventActivity.new
      @event_activity.event_id = @event.id
      @event_activity.activity_id = @activity.id
      if @event_activity.save
        @event.touch
        redirect_to event_url(@event)
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def edit
    @activity = Activity.find_by(id: params[:id])
  end

  def update
    @activity = Activity.find_by(id: params[:id])
    @activity.title = params[:title]
    if @activity.save
      redirect_to activities_url
    else
      render 'edit'
    end
  end

  def destroy
    @event=Event.find_by(id: params[:event_id])
    @activity = Activity.find_by(id: params[:id])
    @activity.delete
    redirect_to activities_url
  end
end
