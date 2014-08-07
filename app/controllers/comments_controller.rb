class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    @comment.save!
    redirect_to polymorphic_path([@project, @commentable])
  end

  def edit
    @project = Project.find(params[:project_id])
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable
  end

  def update
    @project = Project.find(params[:project_id])
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable

    @comment.update!(comment_params)
    redirect_to polymorphic_path([@project, @commentable])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :title, :commentable_type, :commentable_id)
  end

  def find_commentable
    comment = params[:comment]
    klass = comment[:commentable_type].capitalize.constantize
    klass.find(comment[:commentable_id])
  end
end
