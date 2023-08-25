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
      @car.update(offer_status: true)
      redirect_to @car, notice: 'Car was successfully created.'
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated.'
    else
      puts "errors #{@car.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, status: 303, notice: 'Car was successfully deleted.'
  end

  def check_login
    render json: { login_required: !user_signed_in? }
  end

  private

  def car_params
    params.require(:car).permit(:car_model, :car_info, :car_price, :offer_status, :seller_id)
  end
end
