class User < ActiveRecord::Base
  has_many :events
  has_many :menus
  has_many :reviews
  has_many :messages
end
