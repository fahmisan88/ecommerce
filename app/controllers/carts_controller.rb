class CartsController < ApplicationController
  before_action :load_cart, except: [:show]
  skip_before_action :furnish_cart_items, except: [:show]
  after_action :write_cart, only: [:minus, :plus, :add_item, :remove_item, :update_item]

  def show
  end

  def add_item
    flash[:success] = "Added To Cart"
    if @cart[params[:id]]
      quantity = params[:quantity].to_i
      quantityOld = @cart[params[:id]].to_i
      @cart[params[:id]] = quantityOld + quantity
    else
      @cart[params[:id]] = params[:quantity].to_i
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

  def plus
    quantity = @cart[params[:id]]
    @cart[params[:id]] = quantity + 1
  end

  def minus
    if @cart[params[:id]] = 1
      
    else
      quantity = @cart[params[:id]]
      @cart[params[:id]] = quantity - 1
    end
  end

  private

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
