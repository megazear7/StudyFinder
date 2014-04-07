FactoryGirl.define do
  factory :school do
    name "Test School"

    factory :school_with_buildings do
      association :building, factory: :building
    end

  end
end
