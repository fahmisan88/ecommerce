class ItemsController < ApplicationController

  def index
    @item=Item.new
    @items = Item.all.order(created_at: :desc)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end