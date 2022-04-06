#Movie model
class Movie < ApplicationRecord
  RATINGS = %w(G PG PG-13 R NC-17)
  has_many :reviews, dependent: :destroy

  validates :title, :duration, :released_on, presence: true
  validates :description, length: {minimum: 25}
  validates :total_gross, numericality: {greater_than_or_equal: 0}
  validates :rating, inclusion: {in: RATINGS}

  validates :image_file_name, format: {
    with: /\w+\.(jpg|png)\z/i,
    message: "must be a JPG or PNG image"
  }

  def self.not_flop
    Movie.where('total_gross > ?',100_000_000)
  end 

  def flop? 
    total_gross.blank? || total_gross < 100_000_000 
  end

end
