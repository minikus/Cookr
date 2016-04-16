# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  password_digest :text
#  email           :string
#  admin           :boolean
#  chef            :boolean
#  phone           :string
#  image           :text
#  bio             :text
#  rate            :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true, :uniqueness => true

  has_many :events
  has_many :menus
  has_many :reviews
  has_many :messages
end
