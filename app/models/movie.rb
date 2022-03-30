class Movie < ApplicationRecord
  RATINGS = %w(G PG PG-13 R NC-17)
  has_many :reviews, dependent: :destroy

  validates :title, :duration, :released_on, presence: true
  validates :description, length: {minimum: 25}
  validates :total_gross, numericality: {greater_than_or_equal: 0}
  validates :rating, inclusion: {in: RATINGS}

  def self.not_flop
    Movie.where("total_gross > ?",100000000)
  end 
  def flop? 
    total_gross.blank? || total_gross < 100000000 
  end 
end
