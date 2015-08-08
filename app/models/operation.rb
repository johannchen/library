class Operation < ActiveRecord::Base
  belongs_to :user
  belongs_to :mybook
end
