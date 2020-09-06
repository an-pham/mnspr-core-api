class BoardsController < ApplicationController
  def create
    puts new_board_params
    board = BoardService.new(new_board_params["r"], new_board_params["c"], new_board_params["bombs"] || 10).generate
    render json: {
      status:	:ok,
      rows: new_board_params[:r],
      cols: new_board_params[:c],
      bombs: new_board_params[:bombs],
      board: board
    }
  end

  private

  def new_board_params
    @new_params ||= params.permit(:r, :c, :bombs)
  end
end
