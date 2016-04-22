class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    if !@current_user.present?
      redirect_to login_path
    else
      @messages = Message.all
      @users = User.all
    end
  end

  def get_messages
    if @current_user.present?
      messages = Message.where("target = ? OR user_id = ?", @current_user.id, @current_user.id)
      render :json => {
        :messages => messages
      }
    else
      redirect_to root_path
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
    @users = User.all
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create

    @message = Message.new(message_params)
    @message.save
    render :json => {:status => 'ok'}

  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    message = Message.find params[:id]
    message.update message_params
    render :json => {:status => 'ok'}
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:user_id, :target, :message, :seen, :archive)
    end
end
