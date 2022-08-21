class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end
  
  private

  def public_item_params
    params.require(:item).permit(:name, :price, :image, :introduction, :genre_id ,:is_active)
  end
end
