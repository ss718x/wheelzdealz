class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.seller = current_user

    if @car.save
      redirect_to @car, notice: 'Car was successfully created.'
    else
      render :new
    end
  end

  def check_login
    render json: { login_required: !user_signed_in? }
  end

  private

  def car_params
    params.require(:car).permit(:car_model, :car_info, :car_price, :offer_status, :seller_id)
  end
end
