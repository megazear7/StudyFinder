class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]

  # GET /buildings
  # GET /buildings.json
  def index

    @buildings = Building.paginate(:page => params[:page], :per_page => 10)
    @title = "All Available Buildings"
    @all = true

    if current_user and params[:all] != "true"
      @buildings = Building.where(school_id: current_user.school.id).paginate(:page => params[:page], :per_page => 10)
      @title = "Buildings at " + current_user.school.name
      @all = false
    end

    @search = params[:search] ? params[:search] : ""

    if not @search.empty?
      @buildings = @buildings.search(@search)
    end

    @buildings = @buildings.paginate(:page => params[:page], :per_page => 10)

  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
    @rooms = @building.rooms

    @search = params[:search] ? params[:search] : ""

    if not @search.empty?
      @rooms = @rooms.search(@search)
    end

    @rooms = @rooms.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Building was successfully created.' }
        format.json { render action: 'show', status: :created, location: @building }
      else
        format.html { render action: 'new' }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: 'Building was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_params
      params.require(:building).permit(:school_id, :name, :rooms_attributes => [:id, :room_number, :_destroy])
    end
end
