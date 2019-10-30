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
        redirect_to gossips_path
    end
end
