class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [ :show ]

  # Method to show all restaurants
  def index
    @restaurants = Restaurant.all
  end

  # Method to show one restaurant with set_restaurant
  def show
  end

  # Methods to create a new restaurant
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(rest_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rest_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
