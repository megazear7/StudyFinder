class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_study_session, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_room, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]
  before_action :validate_owner, only: [:edit, :update, :new, :create, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = @study_session.notes.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to room_study_session_path(@note.study_session.room, @note.study_session), notice: 'Note was successfully created.' }
        format.json { render action: 'show', status: :created, location: @note }
      else
        format.html { render action: 'new' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to room_study_session_path(@note.study_session.room, @note.study_session), notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to room_study_session_url(@study_session, @study_session.room) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def validate_owner
      if current_user != @note.user 
        redirect_to room_study_session_path(@note.study_session.room, @note.study_session), notice: 'You are not allowed to edit that note: It is not yours'
      end
    end

    def set_note
      @note = Note.find(params[:id])
    end

    def set_study_session
      @study_session = StudySession.find(params[:study_session_id])
    end

    def set_room
      @room = Room.find(params[:room_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:study_session_id, :room_id, :user_id, :summary)
    end
end
