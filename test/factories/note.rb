FactoryGirl.define do
  factory :note do
    summary "Test Summary for study session"

    factory :note_complete do
      association :study_session, factory: :study_session
      association :user, factory: :complete_user_2
    end
  end
end
