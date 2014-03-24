class Room < ActiveRecord::Base
  belongs_to :building
  has_many :study_sessions
end
