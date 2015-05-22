class NotesController < ApplicationController
  before_action :authorize

  def authorize
    if session[:user_id].blank?
      redirect_to root_url, notice: "Not Authorized"
    end
  end

  def new
    @event=Event.find_by(id: params[:event_id])
    @note = Note.new
  end

  def create
    @event = Event.find_by(id: params[:event_id])
    @note = Note.new
    @note.title = params[:title]
    @note.desc = params[:desc]
    @note.event_id = params[:event_id]
    if @note.save
      @event.touch
      redirect_to event_url(@event)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find_by(id: params[:event_id])
    @note = Note.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:event_id])
    @note = Note.find_by(id: params[:id])
    @note.title = params[:title]
    @note.desc = params[:desc]
    @note.event_id = params[:event_id]
    if @note.save
      @event.touch
      redirect_to event_url(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find_by(id: params[:event_id])
    @note = Note.find_by(id: params[:id])
    @note.delete
    @event.touch
    redirect_to event_url(@event)
  end

end