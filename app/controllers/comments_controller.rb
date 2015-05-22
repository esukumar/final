class CommentsController < ApplicationController
  before_action :authorize

  def authorize
    if session[:user_id].blank?
      redirect_to root_url, notice: "Not Authorized"
    end
  end

  def create
    @event = Event.find_by(id: params[:event_id])
    @comment = Comment.new
    @comment.desc = params[:desc]
    @comment.note_id = params[:note_id]
    @comment.image_id = params[:image_id]
    @comment.user_id = session[:user_id]
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