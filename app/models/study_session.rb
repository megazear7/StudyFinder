class StudySession < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  has_many :notes
end
