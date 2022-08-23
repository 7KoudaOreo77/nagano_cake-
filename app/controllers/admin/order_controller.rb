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

    @order.order_details.each do |order_detail|
     if order_detail.making_status == "making"
       @order.update(status: "making")
     end
    end

    @order.order_details.each do |order_detail|
     if order_detail.making_status == "making"
       @order.update(status: "making")
     end
    end

     if @order.order_details.making_status == "finish"
       @order.update(status: "ready")
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
