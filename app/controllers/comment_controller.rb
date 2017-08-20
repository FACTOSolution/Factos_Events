class CommentController < ApplicationController
  def index
    @comments = Comment.where(event_id: params[:event_id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    if @comment.save
      redirect_to event_index_url, flash: { success: t('flash.create.success', entity: Comment) }
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :user_id)
  end
end
