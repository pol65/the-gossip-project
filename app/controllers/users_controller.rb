class UsersController < ApplicationController

    before_action :authenticate_user, only: [:show]

    def index 
        @users = User.all
      end
      def show
          @user = User.find(params[:id])
      end
    def create
        @user = User.new(
            email: params[:user_email],
            password: params[:user_password],
            first_name: params[:user_first_name],
            last_name: params[:user_last_name],
            description: params[:user_description],
            age: params[:user_age],
            city_id: City.first.id
        )
        @user.save!
        redirect_to root_path
    end

    def authenticate_user
        unless current_user
          flash[:danger] = "Please log in."
          redirect_to new_session_path
        end
      end

end