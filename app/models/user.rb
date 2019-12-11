class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, uniqueness: true
  validates :username, length: { minimum: 4}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :purchases
  has_many :ratings
  has_many :books

  has_many :purchased_books, through: :purchases, source: :books

  has_and_belongs_to_many :roles

  #check if user has role
  def has_role?(role_name)
    roles.include?(Role.where(name: role_name).first)
  end

  #when adding a new role, if it doesnt already exist, add it as a role
  def add_role(role_name)
    new_role = roles.where(name: role_name).first
    new_role ||= Role.create(name: role_name)
    roles << new_role
  end
end
