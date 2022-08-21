class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    #@item = Item.find(params[:id])
    @cart_item_price = 0
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
  end

  def create
    #binding.pry
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id

    # 1. 追加した商品がカート内に存在するかの判別
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      # 存在した場合
      # 2. カート内の個数をフォームから送られた個数分追加する
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount = cart_item.amount+params[:cart_item][:amount].to_i
      cart_item.save
    else
      @cart_item.save
    end

    redirect_to public_cart_items_path

  end

  private

  def cart_item_params
   params.require(:cart_item).permit(:item_id, :customer_id ,:amount)
  end
end
