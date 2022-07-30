class Admin::GenresController < ApplicationController
  def index

  end

  def create
    @ganre = Genre.new(admin_genre_params)
    @ganre.user_id = current_user.id
    @ganre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
  end

  private

  def admin_genre_params
    params.require(:admin_genre).permit(:name)
  end

end
