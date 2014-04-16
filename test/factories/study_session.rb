FactoryGirl.define do
  factory :study_session do
    name "Test Study Session"
    summary "Test Study Session summary"
    meeting_time DateTime.now
    subject "test"

    factory :study_session_complete do
      association :room, factory: :room_complete
      association :user, factory: :complete_user_2
      ignore do
        notes_count 5
      end
      after(:create) do |study_session, evaluator|
        create_list(:note, evaluator.notes_count, study_session: study_session, user: evaluator.user)
      end
    end
  end
end
