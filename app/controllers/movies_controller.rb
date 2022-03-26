class MoviesController < ApplicationController
  def index
    @movies = Movie.all 
  end
  def show
    #fail
    @movie = Movie.find(params[:id])
  end 
end
