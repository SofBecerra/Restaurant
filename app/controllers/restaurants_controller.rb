class RestaurantsController < ApplicationController
    def index
      @restaurants = Restaurant.all
    end

    def show
      @restaurant = Restaurant.find(params[:id])
    end

    def new
      @restaurant = Restaurant.new
    end

    def create
      @restaurant = Restaurant.new(restaurant_params)

      if @restaurant.save
        respond_to do |format|
          format.html { redirect_to restaurants_path }
          format.turbo_stream
        end
      else
        render :new
      end
    end

    def edit
      @restaurant = Restaurant.find(params[:id])
    end

    def update
      @restaurant = Restaurant.find(params[:id])

      if @restaurant.update(restaurant_params)
        redirect_to restaurants_path
      else
        render :edit
      end
    end

    def destroy
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy
      respond_to do |format|
        format.html { redirect_to restaurants_url }
        format.turbo_stream
      end
    end

    private

    def restaurant_params
      params.require(:restaurant).permit(:name, :address)
    end
end
