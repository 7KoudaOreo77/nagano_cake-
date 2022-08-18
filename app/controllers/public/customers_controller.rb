class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def withdrawal
  end

  def destroy
  end

  private

  def admin_customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
end
