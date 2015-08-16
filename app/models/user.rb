class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence:true, on: :create


  has_many :mybooks
  has_many :books, through: :mybooks

  has_many :operations
  has_many :borrowed_books, through: :operations, class_name: "Mybook", source: :mybook
end
