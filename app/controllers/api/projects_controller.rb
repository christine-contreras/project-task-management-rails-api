class Api::ProjectsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_project, only: [:update, :destroy, :show]

    def index
        projects = Project.all
        render json: projects, include: ['project', 'project.boards', 'project.boards.tasks'], status: :ok
    end

    def show
        render json: @project, include: ['project', 'project.boards', 'project.boards.tasks'], status: :ok
    end

    def create 
        project = Project.create(product_params)
        render json: project, include: ['project', 'project.boards', 'project.boards.tasks'], status: :created
    end

    def update 
        @project.update(product_params)
        render json: @project, include: ['project', 'project.boards', 'project.boards.tasks'], status: :accepted
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
