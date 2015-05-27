class ActivitiesController < ApplicationController
  before_action :authorize, :only => [:new, :create, :edit, :update, :destroy]

  def authorize
    if session[:user_id].blank?
      redirect_to root_url, notice: "Not Authorized"
    end
  end

  def index
    @user = User.find_by(id:session[:user_id])
    if params[:keyword].present?
      @activities = Activity.where("title LIKE ?","%#{params[:keyword]}%")
    else
      @activities = Activity.all
    end
    @activities = @activities.order('title asc')
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
    @event_activity = EventActivity.new
    @errors = []
  end

  def create
    @event=Event.find_by(id: params[:event_id])
    if Activity.exists?(title: params[:title])
      @activity=Activity.find_by(title: params[:title])
    else
      @activity = Activity.new
      @activity.title = params[:title]
      if not @activity.save
        @errors = @activity.errors
        render 'new'
        return
      end
    end
    @event_activity = EventActivity.new
    @event_activity.event_id = @event.id
    @event_activity.activity_id = @activity.id
    if @event_activity.save
      @event.touch
      redirect_to event_url(@event)
    else
      @errors = @event_activity.errors
      render 'new'
    end
  end

  def edit
    @activity = Activity.find_by(id: params[:id])
    @errors = []
  end

  def update
    @activity = Activity.find_by(id: params[:id])
    @activity.title = params[:title]
    if @activity.save
      redirect_to activities_url
    else
      @errors = @activity.errors
      render 'edit'
    end
  end

  def destroy
    @event=Event.find_by(id: params[:event_id])
    @activity = Activity.find_by(id: params[:id])
    @activity.destroy
    redirect_to activities_url
  end
end
