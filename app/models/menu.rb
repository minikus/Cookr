# == Schema Information
#
# Table name: menus
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  cuisine     :string
#  description :text
#  pricePP     :float
#  dietry      :text
#  gluten_free :boolean
#  vego        :boolean
#  title       :string
#  image       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Menu < ActiveRecord::Base
  belongs_to :user
end
