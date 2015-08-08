class User < ActiveRecord::Base
  has_many :mybooks
  has_many :books, through: :mybooks

  has_many :operations
  has_many :borrowed_books, through: :operations, class_name: "Mybook", source: :mybook 
end
