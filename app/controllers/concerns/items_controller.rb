class ItemsController < ApplicationController

  def new
    @item=Item.new
  end

  def create
    @item = Item.new

    if @item.save
      flash[:success]
    else
      flash[:danger]
    end

  end

  def edit
    @item = Item.find_by(:id params[:id])
  end

  def update
    @item = Item.find_by(:id params[:id])
    if @item.save
      flash[:success]
    else
      flash[:danger]
    end
  end

  def destroy
    @item = Item.find_by(:id params[:id])
    if @item.destroy
      flash[:success]
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :price)

end
