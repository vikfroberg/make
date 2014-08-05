class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :find_project

  def index
    @taggings = Tagging.where("task_id IN (?)",
      @project.tasks.incompleted.ids.to_a)
    @tags = @taggings.map { |t| t.tag }
    @tags = @tags.compact.uniq

    if params[:tag]
      @tasks = @project.tasks.tagged_with(params[:tag])
    else
      @tasks = @project.tasks.incompleted
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = @project.tasks.create(task_params)
    @task.user = current_user
    @task.save!
    redirect_to [@project, @task]
  end

  def show
    @commentable = @task = @project.tasks.find(params[:id])
    @comments = @task.comments
    @comment = params[:comment] ||  Comment.new
  end

  def edit
    @task = @project.tasks.find(params[:id])
  end

  def update
    @task = @project.tasks.find(params[:id])

    @task.update!(task_params)
    redirect_to project_task_path(@project, @task)
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to project_tasks_path(@project)
  end

  private

  def task_params
    params.require(:task).permit(:tag_list, :title, :description, :promoted)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

end
