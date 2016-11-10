class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
    render "You Suck" unless current_user = @board.user
    @day_locations = build_planner
  end

  private

  def build_planner(past_weeks=1, seldate=Date.today, future_weeks=4)
    start_date = (seldate - (past_weeks * 7).days).monday
    end_date = start_date + ((past_weeks + 1 + future_weeks) * 7).days - 1.day
    result = (start_date .. end_date).to_a.map do |date|
      [date, Availability.where("date = ?", date).first.try(:status)]
    end
    result.each_slice(7).to_a.transpose
  end
end
