class ChefsController < ApplicationController
  def display
    @users = User.where(:chef => true)
    @menus = Menu.all
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :email, :chef, :phone, :image, :bio, :rate)
    end
end
