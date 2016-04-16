class PagesController < ApplicationController
  def welcome

    @users = User.where(:chef => true)
    @menus = Menu.all
  end

end
