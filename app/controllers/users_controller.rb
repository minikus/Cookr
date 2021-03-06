class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authoriseUser, only: [:edit, :update, :destroy]
  before_action :authorise, only: [:index]

  def get_user
    if @current_user.present?
      render json: {
        :user => @current_user
      }
    else
      redirect_to root_path
    end
  end

  def get_users
    if @current_user.present?
      users = User.all.select('id', 'first_name', 'image');
      render :json => {
        :users => users
      }
    else
      redirect_to root_path
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    if params[:user]['image'].present?
      req = Cloudinary::Uploader.upload(params[:user]["image"])
      @user = User.new(user_params)
      @user.update :image => req["url"]
    else
      @user = User.new(user_params)
      @user.update :image => 'https://tracker.moodle.org/secure/attachment/30912/f3.png'
    end


    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    user = @current_user
    user.update user_params

    if params[:user]["image"].present?
      req = Cloudinary::Uploader.upload(params[:user]["image"])
      user.update(:image => req["url"])
    end

    redirect_to user_path

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
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

    def authorise
      redirect_to root_path unless @current_user.present? && @current_user.admin?
    end

    def authoriseUser
      redirect_to root_path unless @current_user.present? && (@current_user.admin? || @current_user.id === @user.id)
    end
end
