class EventsController < ApplicationController
  before_action :authorize, :only => [:new, :create, :edit, :update, :destroy]

  def authorize
    if session[:user_id].blank?
      redirect_to root_url, notice: "Not Authorized"
    end
  end

  def index
    @user = User.find_by(id:session[:user_id])
    if params[:keyword].present?
      @events = Event.where("title LIKE ?","%#{params[:keyword]}%")
    else
      @events = Event.all.limit(1000)
    end
    @events = @events.order('title asc').page params[:page]
  end

  def show
    @user = User.find_by(id:session[:user_id])
    @event = Event.find_by(id: params[:id])
    if @event == nil
      redirect_to events_url, notice: "Event not found"
    else
      @notes = @event.notes.limit(1000)
      @images = @event.images.limit(1000)
      @posts = (@notes+@images).sort_by{|post| post.created_at}.reverse
      @activities = @event.activities.limit(1000)
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
    @event.user_id = session[:user_id]
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
    @event.user_id = session[:user_id]
    @event.save
    if @event.save
      redirect_to events_url
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.destroy
    redirect_to events_url
  end

end