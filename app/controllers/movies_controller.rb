class MoviesController < ApplicationController
  def index
    @movies = Movie.not_flop
  end
  def show
    #fail
    @movie = Movie.find(params[:id])
  end 
  def edit 
    @movie = Movie.find(params[:id])
  end 
  def update
    @movie = Movie.find(params[:id]) 
    @movie.update(movie_params)
    redirect_to @movie
  end 

  def new
    @movie = Movie.new 
  end 

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to @movie
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
