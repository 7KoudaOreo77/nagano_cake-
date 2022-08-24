class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])


  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(admin_item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
  end

  def edit
    @item = Item.find(params[:id])
    @genre = @item.genre
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(admin_item_params)
      redirect_to admin_items_path
    else
      render edit_admin_item_path
    end
  end

  private

  def admin_item_params
    params.require(:item).permit(:name, :price, :image, :introduction, :genre_id ,:is_active)
  end
end
