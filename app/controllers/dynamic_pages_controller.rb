class DynamicPagesController < ApplicationController
  def welcome
  puts Gossip.all
  end
  def gossip

  end
end
