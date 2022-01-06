class FoodController < ApplicationController


    def show
        @food = Food.find(params[:id])
    
    end


end
