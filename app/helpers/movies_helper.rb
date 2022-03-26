module MoviesHelper
  def description(movie)
    truncate(movie.description, length: 35, separator: ' ')
  end 

  def year_of(movie)
    movie.released_on.strftime("%Y")
  end 

  def total_gross(movie)
    if movie.flop?
        "Floop"
    else
      number_to_human(movie.total_gross, precision:  2, delimeter: ",")
    end 
  end 
end
