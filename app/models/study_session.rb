class StudySession < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  has_many :notes

  def self.search search
    joins([:room => [:building => :school]]).where("
        rooms.room_number LIKE ? OR 
        LOWER(study_sessions.name) LIKE ? OR
        LOWER(study_sessions.summary) LIKE ? OR
        LOWER(buildings.name) LIKE ? OR
        LOWER(schools.name) LIKE ?
        ", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
  end

end
