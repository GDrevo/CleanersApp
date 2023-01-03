class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if user_signed_in?
      @user = current_user
    else
      @user = User.new(name: user_params[:new_user_name], phone: user_params[:new_user_phone], email: user_params[:new_user_email], password: user_params[:new_user_password])
      @user.save
      sign_in @user
    end
    @booking.user = @user
    @booking.status = "pending"
    @booking.save
    redirect_to edit_booking_path(@booking)
  end

  def edit
    @booking = Booking.find(params[:id])
    @cleaners = Cleaner.where(location: @booking.city)
  end

  private

  def booking_params
    params.require(:booking).permit(:bedrooms, :bathrooms, :cleaning_type, :number_of_visits, :start_date, :end_date, :address, :city, :country, :zipcode, :size)
  end

  def user_params
    params.require(:booking).permit(:new_user_name, :new_user_phone, :new_user_email, :new_user_password)
  end
end
