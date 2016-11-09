class ReviewsController < ApplicationController
  before_action :set_board

  def create
    @review = Review.create(review_params)
    @review.user = current_user
    @review.board = @board
    if @review.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to board_path(@board)
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
