class Exchange < ActiveRecord::Base
  belongs_to :requester, class_name: 'User'
  belongs_to :responder, class_name: 'User'
  belongs_to :requester_book, class_name: 'Book'
  belongs_to :responder_book, class_name: 'Book'
end
