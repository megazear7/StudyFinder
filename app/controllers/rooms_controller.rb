class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    #@rooms = Room.all
    @rooms = Room.all
    @title = "All Available Rooms"
    @all = true

    if current_user and params[:all] != "true"
      @rooms = current_user.school.rooms
      @title = "Rooms at " + current_user.school.name
      @all = false
    end

    @search = params[:search] ? params[:search] : ""

    if not @search.empty?
      @rooms = @rooms.search(@search)
    end

    @rooms = @rooms.paginate(:page => params[:page], :per_page => 10)

  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @study_sessions = @room.study_sessions.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /rooms/new
  def new
    if params[:all] == "true"
      @buildings = Building.all
      @title = "Choose a building to add a room to"
    else
      @buildings = current_user.school.buildings
      @title = "Choose a building at " + current_user.school.name + " to add a room to"
    end
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render action: 'show', status: :created, location: @room }
      else
        format.html { render action: 'new' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:building_id, :room_number)
    end
end
