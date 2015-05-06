class EventsController < ApplicationController

  def index
    @events = Event.order('title asc')
  end

  def show
    @event = Event.find_by(id: params[:id])
    if @event == nil
      redirect_to events_url, notice: "Event not found"
    else
      @notes = @event.notes
    end
  end

  def new

  end

  def create
    event = Event.new
    event.title = params[:title]
    event.picture = params[:picture]
    event.save
    redirect_to events_url
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.title = params[:title]
    @event.picture = params[:picture]
    @event.save
    redirect_to event_url(params[:id])
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.delete
    redirect_to events_url
  end

end