FactoryGirl.define do
  factory :school do
    name "Test School"

    factory :school_with_buildings do
      ignore do
        buildings_count 5
      end
      after(:create) do |school, evaluator|
        create_list(:building, evaluator.buildings_count, school: school)
      end
    end
  end
end
