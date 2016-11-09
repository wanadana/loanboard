class Users::BoardsController < ApplicationController
  before_action :set_categories, only: [:new, :create, :edit, :update]
  # prepend_view_path "app/views/boards"
  def new
    @board = Board.new
    render "boards/new.html.erb"
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user
    if @board.save
      redirect_to boards_path
    else
    render "boards/new.html.erb"
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
      render :edit
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

  def set_categories
    @categories = Board::CATEGORIES
  end
end

