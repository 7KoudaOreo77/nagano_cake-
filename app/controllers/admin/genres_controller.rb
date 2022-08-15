class Admin::GenresController < ApplicationController
  def index
    @genre_new = Genre.new
    @genres = Genre.all


  end

  def create
    @genre = Genre.new(admin_genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find_by(id: params[:id])
  end

  def update
    @genre = Genre.find_by(id: params[:id])
    @genre.name = params[:genre][:name]
    if @genre.save
      redirect_to admin_genres_path
    else
      render edit_admin_genre_path
    end
  end

  private

  def admin_genre_params
    params.require(:genre).permit(:name)
  end

end
