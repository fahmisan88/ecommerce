class OrderedItemsController < ApplicationController

  def create
    @order = current_order
    @ordered_item = @order.ordered_items.new(ordered_item_params)
    @order.save
    session[:order_id]= @order.id
  
  end

  def update
    @order = current_order
    @ordered_item = @order.ordered_items.find(params[:id])
    @ordered_item.update_attributes(ordered_item_params)
    @ordered_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @ordered_item.destroy
    @ordered_items = @order.order_items
  end

  private

  def ordered_item_params
    params.require(:ordered_item).permit(:quantity, :item_id)
  end


end
