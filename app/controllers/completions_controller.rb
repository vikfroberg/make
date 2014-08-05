class CompletionsController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    task = project.tasks.find(params[:task_id])
    if (params[:todo_id])
      todo = task.todos.find(params[:todo_id])
      todo.complete
    else
      task.complete
    end
    redirect_to project_task_path(project, task)
  end
end
