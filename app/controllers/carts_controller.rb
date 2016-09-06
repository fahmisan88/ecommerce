class CartsController < ApplicationController
  before_action :load_cart
  after_action :write_cart, only: [:add_item, :remove_item, :update_item]

  def show
    @items = []
    @total_price = 0.0;

    @cart.each do |item_id,quantity|
      item = Item.find_by(id: item_id)
      item.define_singleton_method(:quantity) { quantity }
      price = item.price * quantity.to_f
      @total_price += price
      @items << item
    end
  end

  def add_item
    flash[:success] = "Added To Cart"
    if @cart[params[:id]]
      quantity = params[:quantity].to_i
      quantityOld = @cart[params[:id]].to_i
      @cart[params[:id]] = quantityOld + quantity
    else
      @cart[params[:id]] = params[:quantity]
    end
    flash[:success] = "Added To Cart"
  end

  def update_item
    if @cart[params[:id]]
      @cart[params[:id]] = params[:quantity]
    end
    flash[:success] = "Cart Updated"
    redirect_to cart_path(:item)
  end

  def remove_item
    @cart.delete params[:id]
    redirect_to cart_path(:item)
  end

  def load_cart
    if cookies[:cart]
      @cart = JSON.parse(cookies[:cart])
    else
      @cart = {}
    end
  end

  def write_cart
    cookies[:cart] = JSON.generate(@cart)
  end

end
