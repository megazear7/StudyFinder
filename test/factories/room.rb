FactoryGirl.define do
  factory :room do
    room_number 111

    factory :room_complete do
      association :building, factory: :building_with_school_and_rooms
      ignore do
        rooms_count 5
      end
      after(:create) do |room, evaluator|
        create_list(:study_session, evaluator.rooms_count, room: room)
      end
    end
  end
end
