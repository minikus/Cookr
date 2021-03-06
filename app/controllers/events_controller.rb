class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorisePerson, :only => [:show, :edit, :update, :destroy]
  before_action :authorise, :only => [:index, :show, :new, :create, :edit, :update, :destroy]


  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find params[:id]
  end

  # GET /events/new
  def new
    @event = Event.new
    if params[:menu_id].present?
      @menu = Menu.find params[:menu_id]
    else
      @menu = Menu.new
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @current_user.events << @event
    @event.confirm = nil
    @event.save

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.find params[:id]
     @event.update event_params
    #@event.save
    redirect_to events_path
    # render :json => {:status => 'ok'}
    # respond_to do |format|
    #   if @event.update(event_params)
    #     format.html { redirect_to @event, notice: 'Event was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @event }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @event.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def confirm
    @event = Event.find params[:event_id]
    @event.update :confirm => true
    render :json => {:status => 'ok'}
  end

  def cancel
    @event = Event.find params[:event_id]
    @event.update :confirm => false
    render :json => {:status => 'ok'}
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_menus
    @menus = Menu.all
    render :json => {
      :menus => @menus
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:time, :suburb, :address, :user_id, :chef_id, :menu_id, :description, :guests, :confirm, :price)
    end

    def authorise
    redirect_to root_path unless (@current_user.present?)
    end

    def authorisePerson
      redirect_to root_path unless (@current_user.id === @event.user_id || @event.chef_id)
    end

end
