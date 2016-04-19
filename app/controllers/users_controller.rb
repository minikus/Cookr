class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def get_user
    render json: {
      :user => @current_user
    }
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
    req = Cloudinary::Uploader.upload(params[:user]["image"])
    @user = User.new(user_params)
    @user.update :image => req["url"]

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
end
