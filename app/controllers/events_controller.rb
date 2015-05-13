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
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.title = params[:title]
    @event.picture = params[:picture]
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