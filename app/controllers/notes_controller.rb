class NotesController < ApplicationController

  def index
    @notes = Note.order('title asc')
  end

  def show
    @note = Note.find_by(id: params[:id])
    if @note == nil
      redirect_to notes_url, notice: "Note not found"
    end
  end

  def new

  end

  def create
    note = Note.new
    note.title = params[:title]
    note.time = params[:time]
    note.desc = params[:desc]
    note.save
    redirect_to notes_url
  end

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.title = params[:title]
    @note.time = params[:time]
    @note.desc = params[:desc]
    @note.save
    redirect_to note_url(params[:id])
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    @note.delete
    redirect_to notes_url
  end

end