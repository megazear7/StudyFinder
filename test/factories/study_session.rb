FactoryGirl.define do
  factory :study_session do
    name "Test Study Session"
    summary "Test Study Session summary"

    factory :study_session_complete do
      association :room, factory: :room
      ignore do
        notes_count 5
      end
      after(:create) do |study_session, evaluator|
        create_list(:note, evaluator.notes_count, study_session: building)
      end

    end

  end
end
