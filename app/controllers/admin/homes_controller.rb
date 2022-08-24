class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
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