class Api::BoardsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_board, only: [:update, :destroy, :show]

    def index
        boards = Board.all
        render json: boards, status: :ok
    end

    def show
        render json: @board,  status: :ok
    end

    def create 
        board = Board.create(board_params)
        render json: board, status: :created
    end

    def update 
        @board.update(board_params)
        render json: @board, status: :accepted
    end

    def destroy 
        @board.destroy 
        head :no_content
    end


    private

    def set_board
        @board = Board.find(params[:id])
    end

    def board_params
        params.permit(:name, :project_id)
    end

    def render_not_found_response
        render json: { errors: ['Board Not Found'] }, status: :not_found
    end
end
