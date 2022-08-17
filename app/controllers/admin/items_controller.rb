class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.save
      redirect_to admin_items_path
    else
      render edit_admin_item_path
    end
  end

  private

  def admin_genre_params
    params.require(:item).permit(:name, :price, :image, :introduction)
  end
end
