FactoryGirl.define do

  class IncSeq < Array

    def initialize size
      @array = Array.new(size)
      (1..size).each do |val|
        @array[val-1] = val
      end
      @current = 0
    end

    def next blah
      @current += 1
      @array[@current-1]
    end

  end

  factory :building do
    name "Test Building"

    factory :building_with_school_and_rooms do
      association :school, factory: :school
      ignore do
        rooms_count 1
      end
      after(:create) do |building, evaluator|
        create_list(:room, evaluator.rooms_count, building: building, room_number: evaluator.increment_sequence(IncSeq.new(100)))
      end
    end

  end
end
