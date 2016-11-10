class Users::BoardsController < ApplicationController
  before_action :set_categories, only: [:new, :create, :edit, :update]
  # prepend_view_path "app/views/boards"
  before_action :set_board, only: [:edit, :destroy]

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
    render "You Suck" unless current_user = @board.user
    @day_locations = build_planner
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
    @board.destroy
    redirect_to boards_path
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:description, :price, :category, :photo, :photo_cache)
  end

  def set_categories
    @categories = Board::CATEGORIES
  end

  def build_planner(past_weeks=1, seldate=Date.today, future_weeks=4)
    start_date = (seldate - (past_weeks * 7).days).monday
    end_date = start_date + ((past_weeks + 1 + future_weeks) * 7).days - 1.day
    result = (start_date .. end_date).to_a.map do |date|
      [date, Availability.where("date = ?", date).first.try(:status)]
    end
    result.each_slice(7).to_a.transpose
  end
end

