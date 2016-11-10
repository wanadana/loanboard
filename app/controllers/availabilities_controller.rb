class AvailabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_availability, only: [:show, :edit, :update, :destroy, :make_booking, :cancel_booking]

  # GET /availabilities
  # GET /availabilities.json
  def index
    @board = Board.find(params[:board_id])
    @availabilities = @board.availabilities
    @day_locations = build_planner
  end

  # GET /availabilities/1
  # GET /availabilities/1.json
  def show
  end

  # GET /availabilities/new
  def new
    @board = Board.find(params[:board_id])
    @availability = @board.availabilities.new
  end

  # GET /availabilities/1/edit
  def edit
  end

  # POST /availabilities
  # POST /availabilities.json
  def create
    @availability = Availability.new(availability_params)

    respond_to do |format|
      if @availability.save
        format.html { redirect_to @availability, notice: 'Availability was successfully created.' }
        format.json { render :show, status: :created, location: @availability }
      else
        format.html { render :new }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availabilities/1
  # PATCH/PUT /availabilities/1.json
  def update
    respond_to do |format|
      if @availability.update(availability_params)
        format.html { redirect_to @availability, notice: 'Availability was successfully updated.' }
        format.json { render :show, status: :ok, location: @availability }
      else
        format.html { render :edit }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availabilities/1
  # DELETE /availabilities/1.json
  def destroy
    @availability.destroy
    respond_to do |format|
      format.html { redirect_to availabilities_url, notice: 'Availability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def make_booking
    if @availability.available?
      @availability.make_booking(current_user)
    else
      puts "Sorry, already booked"
    end
    redirect_to board_availabilities_url(@availability.board)
  end

  def cancel_booking
    if current_user.id == @availability.booked_by
      @availability.cancel_booking_booked
    else
      puts "You can only cancel your own booking"
    end
    redirect_to board_availabilities_url(@availability.board)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability
      @availability = Availability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_params
      # params.fetch(:availability, { })
      params.require(:availability).permit(:board_id, :date)
    end

    def build_planner(past_weeks=1, seldate=Date.today, future_weeks=4)
      start_date = (seldate - (past_weeks * 7).days).monday
      end_date = start_date + ((past_weeks + 1 + future_weeks) * 7).days - 1.day
      result = (start_date .. end_date).to_a.map do |date|
        [date, Availability.where("date = ?", date).first]
      end
      result.each_slice(7).to_a.transpose
    end
end
