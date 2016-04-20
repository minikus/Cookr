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

  has_many :events, :dependent => :destroy
  has_many :menus, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :messages, :dependent => :destroy

  has_many :user_events, :class_name => 'Event', :foreign_key => 'user_id'
  has_many :chef_events, :class_name => 'Event', :foreign_key => 'chef_id'

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def average_rating
    ratings = self.reviews.pluck(:rating)
    return nil if ratings.empty?
    ratings.inject(:+) / ratings.size.to_d # Figure out the average
  end
end
