class OrdersController < ApplicationController

  def create
    @item = get_cart

    @orders = Order.create(total: params[:price], user_id: params[:user_id])

    @item.each do |f|
      @ordereditem = @orders.ordered_items.new(item_id: f.id )

    end

  end

  def get_cart
    if cookies[:cart]
      @cart = JSON.parse(cookies[:cart])
    else
      @cart = {}
    end

    @items = []

    @cart.each do |item_id, quantity|
      item = Item.find_by(id: item_id)

      item.define_singleton_method(:quantity) do
        quantity
      end
      @items << item
    end
    return @items
  end

end
