class FoodsController < ApplicationController


    def index


    end

    def show
        @food = Food.find(params[:id])
    
    end


end
