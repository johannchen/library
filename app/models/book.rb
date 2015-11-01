class Book < ActiveRecord::Base
  validates :title, presence: true

  has_many :mybooks
  has_many :users, :through => :mybooks

  has_many :request_exchanges, class_name: 'Exchange', foreign_key: 'requester_book_id'
  has_many :respond_exchanges, class_name: 'Exchange', foreign_key: 'responder_book_id'

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
