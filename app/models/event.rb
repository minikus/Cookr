# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  time        :datetime
#  suburb      :string
#  address     :string
#  user_id     :integer
#  chef_id     :integer
#  menu_id     :integer
#  description :text
#  guests      :integer
#  confirm     :boolean
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :chef, :class_name => 'User', :foreign_key => 'chef_id'
  belongs_to :menu, :class_name => 'Menu', :foreign_key => 'menu_id'

end
