class Admin::HomesController < ApplicationController

  def top
    @customer = Customer.find_by(last_name: params[:last_name])
    @orders = Order.all

    #@order = Order.find(params[:order][:customer_id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update
    redirect_to admin_order_path(@order.id)
  end

  private

  def admin_top_params
   params.require(:top).permit(:name, :amount, :customer_id ,:is_deleted)
  end
end