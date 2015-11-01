class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence:true, on: :create


  has_many :mybooks
  has_many :books, through: :mybooks

  has_many :request_exchanges, class_name: 'Exchange', foreign_key: 'requester_id'
  has_many :respond_exchanges, class_name: 'Exchange', foreign_key: 'responder_id'
end
