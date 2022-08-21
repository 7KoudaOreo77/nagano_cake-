class Public::OrdersController < ApplicationController
  def new
    @order = Order.new(public_order_params)
  end

  def confirm
    @cart_items = CartItem.all
    @cart_item_price = 0
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def public_order_params
    params.permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
