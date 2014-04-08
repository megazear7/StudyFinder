FactoryGirl.define do
  factory :building do
    name "Test Building"

    factory :building_with_school_and_rooms do
      association :school, factory: :school
      ignore do
        rooms_count 5
      end
      after(:create) do |building, evaluator|
        create_list(:room, evaluator.rooms_count, building: building)
      end
    end

  end
end
