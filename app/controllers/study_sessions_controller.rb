class StudySessionsController < ApplicationController
  before_action :set_study_session, only: [:show, :edit, :update, :destroy]
  before_action :set_room, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]
  before_action :validate_owner, only: [:edit, :update, :destroy]

  # GET /study_sessions
  # GET /study_sessions.json
  def index
    @study_sessions = StudySession.all
    @title = "All Available Study Sessions"

    if current_user and params[:all] != "true"
      @rooms = current_user.school.study_sessions
      @title = "Study Sessions at " + current_user.school.name
    end

  end

  def all
  end

  # GET /study_sessions/1
  # GET /study_sessions/1.json
  def show
  end

  # GET /study_sessions/new
  def new
    @study_session = StudySession.new
  end

  # GET /study_sessions/1/edit
  def edit
  end

  # POST /study_sessions
  # POST /study_sessions.json
  def create
    @study_session = @room.study_sessions.new(study_session_params)

    respond_to do |format|
      if @study_session.save
        format.html { redirect_to room_study_session_path(@study_session.room, @study_session), notice: 'Study session was successfully created.' }
        format.json { render action: 'show', status: :created, location: @study_session }
      else
        format.html { render action: 'new' }
        format.json { render json: @study_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_sessions/1
  # PATCH/PUT /study_sessions/1.json
  def update
    respond_to do |format|
      if @study_session.update(study_session_params)
        format.html { redirect_to room_study_session_path(@study_session.room, @study_session), notice: 'Study session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @study_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_sessions/1
  # DELETE /study_sessions/1.json
  def destroy
    @study_session.destroy
    respond_to do |format|
      format.html { redirect_to room_url(@room) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def validate_owner
      if current_user != @study_session.user 
        redirect_to room_study_session_path(@study_session.room, @study_session), alert: 'You are not allowed to edit that Study Session: It is not yours. However you may add notes to it.'
      end
    end

    def set_study_session
      @study_session = StudySession.find(params[:id])
    end

    def set_room
      @room = Room.find(params[:room_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_session_params
      params.require(:study_session).permit(:room_id, :user_id, :name, :summary)
    end
end
