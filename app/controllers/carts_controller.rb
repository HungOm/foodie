class CartsController < ApplicationController
    # respond_to :json

    # def create
    #     @info = helpers.get_info(params[:restaurant])
    #     respond_with @info
    # end
    

    def add_to_cart

        # initialize session 
        session[:current_cart] = JSON.parse(params[:current_cart])

        render json: { 
          data:session[:current_cart], message:"success"
       }, status: :ok
      # redirect_to new_shipping_address_path ,status: :ok
    end
  

end