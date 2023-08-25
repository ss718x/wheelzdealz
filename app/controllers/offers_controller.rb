class OffersController < ApplicationController
  def index
    if current_user
      @cars_for_sale = current_user.cars
    else
      @cars_for_sale = []
    end

    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
    @car = @offer.car
  end
end
