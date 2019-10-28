class DynamicPagesController < ApplicationController
  def welcome
  end

  def gossip
    @id = params[:page]
  
  end
  def user
    @user_id = params[:profile]
  end
end
