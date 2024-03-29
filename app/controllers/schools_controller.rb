class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all

    @search = params[:search] ? params[:search] : ""

    if not @search.empty?
      @schools = @schools.search(@search)
    end

    @schools = @schools.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /schools/1
  # GET /schools/1.json
  def show

    @search = params[:search] ? params[:search] : ""
    @buildings = @school.buildings

    if not @search.empty?
      @buildings = @buildings.search(@search)
    end

    @buildings = @buildings.paginate(:page => params[:page], :per_page => 10)

  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school }
      else
        format.html { render action: 'new' }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :buildings_attributes => [:id, :name, :_destroy])
    end
end
