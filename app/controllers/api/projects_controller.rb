class Api::ProjectsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_project, only: [:update, :destroy, :show]

    def index
        projects = Project.all
        render json: projects, include: ['boards', 'boards.tasks'], status: :ok
    end

    def show
        render json: @project, include:  ['boards', 'boards.tasks'], status: :ok
    end

    def create 
        project = Project.create(project_params)
        render json: project, include:  ['boards', 'boards.tasks'], status: :created
    end

    def update 
        @project.update(project_params)
        render json: @project, include:  ['boards', 'boards.tasks'], status: :accepted
    end

    def destroy 
        @project.destroy 
        head :no_content
    end


    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.permit(:title, :color, :favorite)
    end

    def render_not_found_response
        render json: { errors: ['Project Not Found'] }, status: :not_found
    end
end
