class UserReservationsController < ApplicationController
  before_action :set_user_reservation, only: %i[ show update destroy ]

  # GET /user_reservations
  def index
    @user_reservations = UserReservation.all

    render json: @user_reservations
  end

  # GET /user_reservations/1
  def show
    render json: @user_reservation
  end

  # POST /user_reservations
  def create
    @user_reservation = UserReservation.new(user_reservation_params)

    if @user_reservation.save
      render json: @user_reservation, status: :created, location: @user_reservation
    else
      render json: @user_reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_reservations/1
  def update
    if @user_reservation.update(user_reservation_params)
      render json: @user_reservation
    else
      render json: @user_reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_reservations/1
  def destroy
    @user_reservation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_reservation
      @user_reservation = UserReservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_reservation_params
      params.require(:user_reservation).permit(:user_id, :trip_id)
    end
end
