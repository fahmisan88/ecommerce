class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  private

  def authenticate!
    unless current_user
      redirect_to root_path
      # flash[:danger] = "You need to login first"
    end
  end

  def current_user
    return unless session[:id]
    @current_user ||= User.find_by(id: session[:id])
  end
  helper_method :current_user

end
