class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:show, :edit, :new]

    def index 
      @gossips = Gossip.all
    end

    def show
        @gossip = Gossip.find(params[:id])
    end

    def edit
        @gossip = Gossip.find(params[:id])
    end

    def create
        @gossip = Gossip.create(title: params[:gossip_title], content: params[:gossip_content], user: current_user) 
        if @gossip.save 
          flash[:success] = "Gossip créé."
          redirect_to root_path
         else
          render "new"
        end
      end

    def update
        @gossip = Gossip.find(params[:id])
        if @gossip.update(title: params[:title], content: params[:content])
          redirect_to @gossip
        else
          render :edit
        end
    end

    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to root_path
    end

    private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
