class PagesController < ApplicationController
  def welcome
    @users = User.where(:chef => true)

  end

end
