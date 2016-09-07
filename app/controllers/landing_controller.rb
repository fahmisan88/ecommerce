class LandingController < ApplicationController

  def index
    @categories= Category.all
    @items = Item.order("created_at desc").limit(6)
  end
end
