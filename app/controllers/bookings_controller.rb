class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    raise
  end

  private

  def booking_params
    params.require(:booking).permit(:bedrooms, :bathrooms, :cleaning_type, :number_of_visits, :start_date)
  end
end
