class Book < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :purchases
  has_many :ratings

  #average ratings for a book
  def average_rating
    ratings.sum / ratings.length
  end
end
