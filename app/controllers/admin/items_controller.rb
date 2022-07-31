class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(admin_item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  private

  def admin_genre_params
    params.require(:item).permit(:name, :price)
  end
end
