class ItemsController < ApplicationController

  def index
    @item=Item.new
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(topic_params)

    if @item.save
      redirect_to items_path
    else
      redirect_to new_item_path
    end
  end


  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
   params.require(:item).permit(:item_name, :item_description, :price, :image)
  end

end
