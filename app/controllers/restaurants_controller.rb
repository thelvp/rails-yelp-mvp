class RestaurantsController < ApplicationController

  # Method to show all restaurants
  def index
    @restaurants = Restaurant.all
  end

  # Method to show one restaurant -- TODO!
  def show
  end

  # Methods to create a new restaurant
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(rest_params)

    if @restaurant.save
      # [ ] TODO: change redirect to restaurant page of created restaurant
      redirect_to restaurants_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def rest_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
