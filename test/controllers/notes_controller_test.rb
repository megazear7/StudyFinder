require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  setup do
    @study_session = FactoryGirl.create(:study_session_complete)
    @note = @study_session.notes[0]
    sign_in @note.user
  end

  test "should get index" do
    get :index, study_session_id: @study_session, room_id: @study_session.room
    assert_response :success
    assert_not_nil assigns(:notes)
  end

  test "should get new" do
    get :new, study_session_id: @study_session, room_id: @study_session.room
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post :create, note: { summary: "Test Summary" }, study_session_id: @note.study_session_id, room_id: @note.study_session.room, study_session_id: @study_session, room_id: @study_session.room
    end

    assert_redirected_to room_study_session_path(assigns(:note).study_session, assigns(:note).study_session.room)
  end

  test "should show note" do
    get :show, id: @note, study_session_id: @note.study_session, room_id: @note.study_session.room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @note, study_session_id: @note.study_session, room_id: @note.study_session.room
    assert_response :success
  end

  test "should update note" do
    patch :update, id: @note, study_session_id: @note.study_session, room_id: @note.study_session.room, note: { summary: "Test Summary Changed", study_session_id: @note.study_session_id }
    assert_redirected_to room_study_session_path(assigns(:note).study_session, assigns(:note).study_session.room)
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete :destroy, id: @note, study_session_id: @note.study_session, room_id: @note.study_session.room
    end

    assert_redirected_to room_study_session_path(@study_session, @study_session.room)
  end
end
