class NotesController < ApplicationController

  def index
    @notes = Note.order('title asc')
  end

  # def show
  #   @note = Note.find_by(id: params[:id])
  #   if @note == nil
  #     redirect_to notes_url, notice: "Note not found"
  #   end
  # end

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
      redirect_to event_url(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find_by(id: params[:event_id])
    @note = Note.find_by(id: params[:id])
    @note.delete
    redirect_to event_url(@event)
  end

end