class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @cart_item_price = 0



    @order = Order.new(order_params)
    @order.shipping_cost = 800


     if params[:order][:address_option] == "0"
       @order.address = current_customer.address
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       #@order.name = current_customer.name

     elsif params[:order][:address_option] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
     elsif params[:order][:address_option] == "2"

     end


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
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
