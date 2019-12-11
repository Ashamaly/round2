class Book < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :purchases
  has_many :ratings
  has_one_attached :bookImage

end
