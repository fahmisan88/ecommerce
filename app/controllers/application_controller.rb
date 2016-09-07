class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  helper_method :current_order
  before_action :furnish_cart_items

  rescue_from Pundit::NotAuthorizedError do |exception|
    flash[:danger] = "You're not authorized"
    redirect_to main_app.root_path
  end

  def furnish_cart_items
    return unless cookies[:cart]
    @cart = JSON.parse(cookies[:cart])
    @total_price = 0.0
    @quantity = 0
    @items = []

    @cart.each do |item_id,quantity|
      item = Item.find_by(id: item_id)
      item.define_singleton_method(:quantity) { quantity }
      @total_price += item.price * quantity.to_f
      @quantity += quantity.to_i
      @items << item
    end
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_user
    return unless session[:id]
    @current_user ||= User.find_by(id: session[:id])
  end
  helper_method :current_user

  private

  def authenticate!
    unless current_user
      redirect_to root_path
      flash[:danger] = "You need to login first"
    end
  end
end
