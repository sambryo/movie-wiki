#movie class
class MoviesController < ApplicationController
  def index
    @movies = Movie.not_flop
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Event successfully updated!'
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'Event successfully updated!'
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url
 end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :total_gross, :released_on, :rating, :director, :duration, :image_file_name)
  end

end
