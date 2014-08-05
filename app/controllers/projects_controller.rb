class ProjectsController < ApplicationController

  before_action :authenticate_user!

  def index
    @projects = current_user.projects.active.order('name ASC')
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.create!(project_params)
    redirect_to projects_path
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    @project.update!(project_params)
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :body, :summary)
  end

end
