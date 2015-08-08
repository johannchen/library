class Book < ActiveRecord::Base
  validates :title, presence: true

  has_many :mybooks
  has_many :users, :through => :mybooks
end
