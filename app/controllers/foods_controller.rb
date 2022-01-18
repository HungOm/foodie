class FoodsController < ApplicationController
    # before_action :authenticate_user!
    def index
    end
    def show

        if !current_user.nil?
          @foods = Food.where(id:search_params[:id])
          @line_items = LineItem.order("created_at").last
      
        else 
          @foods = Food.where(id:search_params[:id])


        end

    
      
    end
    def search
        # results = Food.search(search_params[:q], search_params)
        # foods = results.map do |r|
        #   r.merge(r.delete('_source')).merge('id': r.delete('_id'))
        # end
        # render json: { foods: foods }, status: :ok
        render json: Food.search(params[:query],fields: ['name^5','description^2'], match: :word_start)
    end
      private
      def search_params
        params.permit([:id],:query)
      end
end
