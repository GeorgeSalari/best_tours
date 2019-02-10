class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def new_order
    @order = Order.new
  end

  def new_call_order
    @call_order = CallOrder.new
  end

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
