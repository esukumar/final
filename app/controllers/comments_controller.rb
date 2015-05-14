class CommentsController < ApplicationController

  def create
    @event = Event.find_by(id: params[:event_id])
    @comment = Comment.new
    @comment.desc = params[:desc]
    @comment.note_id = params[:note_id]
    @comment.image_id = params[:image_id]
    if @comment.save
      @event.touch
    end
    redirect_to event_url(@event)
  end

  def destroy
    @event = Event.find_by(id: params[:event_id])
    @comment = Comment.find_by(id: params[:id])
    @comment.delete
    @event.touch
    redirect_to event_url(@event)
  end

end