class CitiesController < ApplicationController

  before_action :authenticate_user, only: [:show]

    def index 
        @cities = City.all
      end
  
      def show
        @cities = City.find(params[:id])
      end

      def authenticate_user
        unless current_user
          flash[:danger] = "Please log in."
          redirect_to new_session_path
        end
      end

end
