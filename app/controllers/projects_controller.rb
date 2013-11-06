class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end
  def show
    @project = Project.find(params[:id])
  end
  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to projects_path
  end
  def destroy

  end
  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
