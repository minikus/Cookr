class PagesController < ApplicationController
  def welcome
    @menus = Menu.all
  end
end
