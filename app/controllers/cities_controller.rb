class CitiesController < ApplicationController
    def index 
        @cities = City.all
      end
  
      def show
        @cities = City.find(params[:id])
      end
end
