FactoryGirl.define do
  factory :user do

    factory :complete_user do
      email "test@test.com"
      password "changeme"
      association :school, factory: :school
    end

    factory :user_without_school do
      email "test@test.com"
      password "changeme"
    end

  end
end
