class TodosController < ApplicationController
  before_action :find_project
  before_action :find_task
  before_action :find_todo, :only => [:edit, :update, :destroy]

  def create
    @task.todos.create!(todo_params)
    redirect_to project_task_path @project, @task
  end

  def todo_params
    params.require(:todo).permit(:content)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_task
    @task = @project.tasks.find(params[:task_id])
  end
end

