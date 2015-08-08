class Mybook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  has_many :operations
  has_many :borrowers, :through => :operations, class_name: 'User', source: :user
end
