class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = policy_scope(Restaurant)
    # policy_scope will return whatever restaurants the user has access to
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
    
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def update
    # # How to perform authorization without Pundit:
    # unless @restaurant.user == current_user
    #   # raise "Not authorized"
    #   redirect_to root_path, alert: "You are not authorized to perform this action." and return
    # end

    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.'
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
      authorize @restaurant
    end

    def restaurant_params
      params.require(:restaurant).permit(:name)
    end
end
