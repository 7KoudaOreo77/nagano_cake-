class Public::AddressesController < ApplicationController
  def index
    @address_new = Address.new
    @addresses = current_customer.addresses

  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(public_address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to public_addresses_path
  end

  def update
    @address = Address.find(params[:id])

    if @address.update(public_address_params)
      redirect_to public_addresses_path
    else
      render edit_public_address_path
    end
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
