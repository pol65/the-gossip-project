class GossipsController < ApplicationController

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
        @gossip = Gossip.new(title: params[:gossip_title], content: params[:gossip_content], user: User.first) 
    
        if @gossip.save 
          redirect_to root_path
          flash[:notice] = "Ton Gossip a été sauvegardé avec succès !" 
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
end
