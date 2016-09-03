class OrdersController < ApplicationController

  def create
    @item = show

    @orders = Order.create(price: params[:price])
    binding.pry
  end

  def show
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

  end

end
