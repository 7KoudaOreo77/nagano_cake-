class Admin::OrderController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update
    redirect_to admin_order_path(@order.id)
  end
end
