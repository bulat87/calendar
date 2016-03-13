class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_filter :authenticate_user!, :only => [:create]

  def create
    @event = Event.find(params[:event_id])
    comment = @event.comments.build(comment_params)
    comment.user = current_user

    if comment.save
      redirect_to event_path(@event)
    else
      redirect_to event_path(@event)
    end
  end

  def destroy
    @comment.delete
    render json: { success: true }
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :event_id)
    end
end