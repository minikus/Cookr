# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  target     :integer
#  rating     :integer
#  review     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :reviewer, :foreign_key => :reviewer_id, :class_name => :User
end
