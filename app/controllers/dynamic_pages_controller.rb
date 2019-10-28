class DynamicPagesController < ApplicationController
  def welcome
  end

  def gossip
    @id = params[:page]
  end
end
