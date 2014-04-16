require 'test_helper'

class StudySessionsControllerTest < ActionController::TestCase
  setup do
    @study_session = FactoryGirl.create(:study_session_complete)
    sign_in @study_session.user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_sessions)
  end

  test "should get new" do
    get :new, room_id: @study_session.room
    assert_response :success
  end

  test "should show study_session" do
    get :show, id: @study_session, room_id: @study_session.room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_session, room_id: @study_session.room
    assert_response :success
  end

  test "should update study_session" do
    patch :update, id: @study_session, study_session: { name: "Test Summary", summary: "Test Summary", room_id: @study_session.room_id }, room_id: @study_session.room
    assert_redirected_to room_study_session_path(@study_session.room, @study_session)
  end

  test "should destroy study_session" do
    assert_difference('StudySession.count', -1) do
      delete :destroy, id: @study_session, room_id: @study_session.room
    end

    assert_redirected_to room_path(@study_session.room)
  end
end
