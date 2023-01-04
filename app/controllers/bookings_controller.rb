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
    calculate_price(@booking)
    calculate_time(@booking)
    @booking.save
    redirect_to edit_booking_path(@booking)
  end

  def edit
    @booking = Booking.find(params[:id])
    @cleaners = Cleaner.where(location: @booking.city)
    @cleaners = @cleaners.where(confirmed?: true)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.cleaner_id = Cleaner.find(params[:format]).id
    @booking.save
    # redirect_to STRIPE
    redirect_to booking_path
  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
    @cleaner = Cleaner.find(@booking.cleaner_id)
  end

  private

  def calculate_price(booking)
    case booking.bedrooms.to_s
    when "Studio"
      price_bed = 0
    when "1"
      price_bed = 10
    when "2"
      price_bed = 20
    when "3"
      price_bed = 30
    when "4"
      price_bed = 40
    when "5"
      price_bed = 50
    end

    case booking.bathrooms.to_s
    when "1"
      price_bat = 0
    when "2"
      price_bat = 25
    when "3"
      price_bat = 50
    when "4"
      price_bat = 80
    when "5"
      price_bat = 120
    when "6+"
      price_bat = 150
    end

    case booking.size
    when 0
      price_siz = 0
    when 25
      price_siz = 10
    when 35
      price_siz = 20
    when 55
      price_siz = 30
    when 80
      price_siz = 40
    when 120
      price_siz = 50
    end

    case booking.cleaning_type.to_s
    when "Standard"
      price_cle = 50
    when "Standard +"
      price_cle = 100
    when "Deep"
      price_cle = 250
    end

    case booking.number_of_visits.to_s
    when "1"
      price_num = 1
    when "2"
      price_num = 2
    when "3"
      price_num = 3
    when "4"
      price_num = 4
    when "5"
      price_num = 5
    end
    booking.price = (price_bed + price_bat + price_siz + price_cle) * price_num
  end

  def calculate_time(booking)
    case booking.bedrooms.to_s
    when "Studio"
      time_bed = 0
    when "1"
      time_bed = 0.5
    when "2"
      time_bed = 1
    when "3"
      time_bed = 1.5
    when "4"
      time_bed = 2
    when "5"
      time_bed = 3
    end

    case booking.bathrooms.to_s
    when "1"
      time_bat = 0
    when "2"
      time_bat = 0.5
    when "3"
      time_bat = 1
    when "4"
      time_bat = 1.5
    when "5"
      time_bat = 2
    when "6+"
      time_bat = 2.5
    end

    case booking.size
    when 0
      time_siz = 0
    when 25
      time_siz = 0.5
    when 35
      time_siz = 1
    when 55
      time_siz = 1.5
    when 80
      time_siz = 2
    when 120
      time_siz = 2.5
    end

    case booking.cleaning_type.to_s
    when "Standard"
      time_cle = 2
    when "Standard +"
      time_cle = 5
    when "Deep"
      time_cle = 8
    end

    case booking.number_of_visits.to_s
    when "1"
      time_num = 1
    when "2"
      time_num = 2
    when "3"
      time_num = 3
    when "4"
      time_num = 4
    when "5"
      time_num = 5
    end
    estimated_time = (time_bed + time_bat + time_siz + time_cle) * time_num
    booking.estimated_time = to_time(estimated_time)
    booking.save
  end

  def to_time(hoursint)
    minutestotal = hoursint * 60
    hours = (minutestotal / 60).to_i
    minutes = (minutestotal % 60).to_i
    "#{hours} hour(s) and #{minutes} minute(s)"
  end

  def booking_params
    params.require(:booking).permit(:bedrooms, :bathrooms, :cleaning_type, :number_of_visits, :start_date, :end_date, :address, :city, :country, :zipcode, :size)
  end

  def user_params
    params.require(:booking).permit(:new_user_name, :new_user_phone, :new_user_email, :new_user_password)
  end
end
