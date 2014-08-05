class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to project_task_path(@project, @task)
    else
      render 'tasks/show'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
    @comment = @task.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to project_task_path(@project, @task)
    else
      render 'edit'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :title)
  end
end
