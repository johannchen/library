class Book < ActiveRecord::Base
  validates :title, presence: true

  has_many :mybooks
  has_many :users, :through => :mybooks

  def self.search_book_count(search)
    where("title like ?", "%#{search}%").count
  end

  def self.search(search)
    if search
      if search_book_count(search) > 0
        where("title like ?", "%#{search}%")
      else
        GoogleBooks.search(search)
      end
    end
  end
end
