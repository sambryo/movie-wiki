class Movie < ApplicationRecord
  def flop? 
    total_gross.blank? || total_gross < 100000000 
  end 
end
