FactoryGirl.define do
  factory :note do
    summary "Test Summary for study session"

    factory :note_complete do
      association :study_session, factory: :study_session
    end
  end
end
