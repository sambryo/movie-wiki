class Movie < ApplicationRecord
  def self.not_flop
    Movie.where("total_gross > ?",100000000)
  end 
  def flop? 
    total_gross.blank? || total_gross < 100000000 
  end 
end
