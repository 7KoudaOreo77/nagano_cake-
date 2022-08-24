class Admin::OrderController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "confirmation"
      @order.order_details.each do |order_detail|
        order_detail.update(making_status: "waiting")
      end
    end





     if @order.status =="finish"
       @order.update(status: "finish")
     end



    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
