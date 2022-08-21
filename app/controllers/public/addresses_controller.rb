class Public::AddressesController < ApplicationController
  def index
    @address_new = Address.new
    @addresses = Address.all

  end

  def edit
  end

  def create
    @address = Address.new(public_address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to public_addresses_path
  end

  def update
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private

  def public_address_params
    params.require(:address).permit(:name, :customer_id, :postal_code, :address)
  end
end
