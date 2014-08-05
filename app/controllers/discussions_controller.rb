class DiscussionsController < ApplicationController
  def new
    @project = current_user.projects.find(params[:project_id])
    @discussion = @project.discussions.build
    @discussion.comments.build
  end

  def create
    @project = current_user.projects.find(params[:project_id])
    @discussion = @project.discussions.create!(discussion_params)
    redirect_to [@project, @discussion]
  end

  def show
    @project = current_user.projects.find(params[:project_id])
    @discussion = @project.discussions.find(params[:id])
    @comments = @discussion.comments
  end

  private

  def discussion_params
    params.require(:discussion).permit(:title, :description,
      :comments_attributes => [:comment, :title])
  end
end
