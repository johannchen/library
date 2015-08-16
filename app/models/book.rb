class Book < ActiveRecord::Base
  validates :title, presence: true

  has_many :mybooks
  has_many :users, :through => :mybooks

  def self.search(search)
    where("title like ?", "%#{search}%") if search
  end
end
