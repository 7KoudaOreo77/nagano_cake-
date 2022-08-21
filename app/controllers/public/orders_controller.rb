class Public::OrdersController < ApplicationController
  def new
    @order = Order.new(order_params)
  end

  def confirm
    @cart_items = CartItem.all
    @cart_item_price = 0
    @order = Order.find(params[:id])
    @orders = Order.all
    
    
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

  def order_params
    params.permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
