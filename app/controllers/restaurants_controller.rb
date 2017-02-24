class RestaurantsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @current_user = current_user
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(:restaurant_id=>params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    if !users_restaurant?(@restaurant)
      flash[:notice] = 'error'
      redirect_to '/restaurants'
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to '/restaurants'
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if users_restaurant?(@restaurant)
      @restaurant.destroy
      flash[:notice] = "Restaurant deleted successfully"
      redirect_to '/restaurants'
    else
      flash[:notice] = "error"
      redirect_to '/restaurants'
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :image)
  end

  def reviews_for_restaurant(id)
    @reviews = Review.where(:restaurant_id=>id)
  end

  def users_restaurant?(restaurant)
    restaurant.user_id == current_user.id
  end


end
