class CommentController < ApplicationController
  #before_action :authenticate_user!

  def index
    @comments = Comment.filter(params.slice(:event_id))
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    if @comment.save
      redirect_to @event, flash: { success: t('flash.create.success', entity: Comment) }
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :user_id)
  end
end
