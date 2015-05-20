class EventsController < ApplicationController

  def index
    @events = Event.order('title asc')
  end

  def show
    @user = User.find_by(email: params[:email])
    @event = Event.find_by(id: params[:id])
    if @event == nil
      redirect_to events_url, notice: "Event not found"
    else
      @notes = @event.notes
      @images = @event.images
      @posts = (@notes+@images).sort_by { |post| post.created_at}.reverse
      @activities = @event.activities
      @event_activities = @activities.map {|activity| EventActivity.find_by(event_id:@event.id,activity_id:activity.id)}
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.title = params[:title]
    @event.picture = params[:picture]
    @event.user_id = cookies[:user_id]
    if @event.save
      redirect_to events_url
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.title = params[:title]
    @event.picture = params[:picture]
    @event.user_id = cookies[:user_id]
    @event.save
    if @event.save
      redirect_to events_url
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.delete
    redirect_to events_url
  end

end