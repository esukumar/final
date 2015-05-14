class ImagesController < ApplicationController

  def new
    @event=Event.find_by(id: params[:event_id])
    @image = Image.new
  end

  def create
    @event = Event.find_by(id: params[:event_id])
    @image = Image.new
    @image.title = params[:title]
    @image.picture = params[:picture]
    @image.event_id = params[:event_id]
    if @image.save
      @event.touch
      redirect_to event_url(@event)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find_by(id: params[:event_id])
    @image = Image.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:event_id])
    @image = Image.find_by(id: params[:id])
    @image.title = params[:title]
    @image.picture = params[:picture]
    @image.event_id = params[:event_id]
    if @image.save
      @event.touch
      redirect_to event_url(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find_by(id: params[:event_id])
    @image = Image.find_by(id: params[:id])
    @image.delete
    @event.touch
    redirect_to event_url(@event)
  end

end