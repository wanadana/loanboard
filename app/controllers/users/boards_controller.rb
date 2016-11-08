class Users::BoardsController < ApplicationController

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user
    if @board.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def edit
    @board = Board.find_by(params[:id])
  end

  def update
    @board.update(board_params)
    if @board.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def destroy
    @board.destory
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:description, :price, :category)
  end

end

