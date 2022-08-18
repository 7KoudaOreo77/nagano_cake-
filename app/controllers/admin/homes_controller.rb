class Admin::HomesController < ApplicationController

  def top

    @customer = Customer.find_by(last_name: params[:last_name])

    @order = Order.new
    @orders = Order.all
  end

  private

  def admin_top_params
   params.require(:top).permit(:name, :amount, :customer_id ,:is_deleted)
  end
end