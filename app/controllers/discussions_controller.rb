class DiscussionsController < ApplicationController
  def index
    @project = current_user.projects.find(params[:project_id])
    @discussions = @project.discussions
  end

  def new
    @project = current_user.projects.find(params[:project_id])
    @discussion = @project.discussions.build
    @comment = @discussion.comments.build
    @comment.user = current_user
  end

  def create
    @project = current_user.projects.find(params[:project_id])
    @discussion = @project.discussions.create!(discussion_params)
    redirect_to [@project, @discussion]
  end

  def show
    @project = current_user.projects.find(params[:project_id])
    @commentable = @discussion = @project.discussions.find(params[:id])
    @comments = @discussion.comments
    @comment = params[:comment] ||  Comment.new
  end

  private

  def discussion_params
    params.require(:discussion).permit(:title, :description,
      :comments_attributes => [:comment, :title])
  end
end
