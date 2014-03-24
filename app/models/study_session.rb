class StudySession < ActiveRecord::Base
  belongs_to :room
  has_many :notes
end
