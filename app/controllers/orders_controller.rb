class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    @order = Order.new( 
    user_id: current_user.id
    # subtotal: calculated_subtotal, 
    # tax: calculated_tax, 
    # total: calculated_total
  )
    @order.save
    carted_products = current_user.carted_products.where(status: "carted")
    carted_products.updated_all(status: "purchased", order_id: @order.id)
    @order.update_totals
    render template: "orders/show"
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render template: "orders/show"
  end

  def index
    @orders = current_user.orders
    render template: "orders/index"
  end
end
