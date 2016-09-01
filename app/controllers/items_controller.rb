class ItemsController < ApplicationController

  def index
    @items = Item.all
    @ordered_item = current_order.ordered_items.new
  end

  def new
    @item=Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success]
    else
      flash[:danger]
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:success]
    end
  end

  private

  def item_params
    params.require(:item).permit( :item_name, :item_description, :price)
    @item=Item.new
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

end
