class FoodsController < ApplicationController
    before_action :authenticate_user!



    def index


    end

    def show
        @food = Food.find(params[:id])
    
    end


end
