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
       @order.name = current_customer.last_name+current_customer.first_name
       #@order.name = current_customer.name

     elsif params[:order][:address_option] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
     elsif params[:order][:address_option] == "2"

     end
  end


  def create
    @order = Order.new(order_params)
    @order.save
     current_customer.cart_items.each do |cart_item|
       @order_detail = OrderDetail.new
       @order_detail.item_id = cart_item.item_id
       @order_detail.order_id = @order.id
       @order_detail.price = cart_item.item.with_tax_price
       @order_detail.amount = cart_item.amount
       @order_detail.making_status = 0
       @order_detail.save
      end
      current_customer.cart_items.destroy_all

    redirect_to thanks_public_orders_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @cart_items = current_customer.cart_items
    @cart_item_price = 0
    @order = Order.find(params[:id])
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
