FactoryGirl.define do
  factory :user do

    factory :complete_user do
      email "test@test.com"
      password "changeme"
      association :school, factory: :school
    end

    factory :complete_user_2 do
      email "test2@test.com"
      password "changeme"
      association :school, factory: :school
    end

    factory :user_without_school do
      email "test3@test.com"
      password "changeme"
    end

  end
end
