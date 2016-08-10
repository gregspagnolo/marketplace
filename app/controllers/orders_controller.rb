class OrdersController < ApplicationController
  before_action :authenticate_user!

  def user_orders
  	@orders = current_user.orders
  end

  def user_sales
  	@services = current_user.services
  end
  
end
