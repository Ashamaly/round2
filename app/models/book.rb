class Book < ApplicationRecord
  #title needs to be present and price needs to be a number. Users can make free book listings
  validates :title, presence: true
  validates :price, numericality: true

  belongs_to :user

  has_and_belongs_to_many :purchases
  has_many :ratings
  has_one_attached :bookImage



end
