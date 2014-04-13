class StudySession < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  has_many :notes

  validates :name, presence: true
  validates :subject, presence: true
  validates :summary, presence: true
  validates :meeting_time, presence: true

  def self.search search
    joins([:room => [:building => :school]]).where("
        rooms.room_number LIKE ? OR 
        LOWER(study_sessions.name) LIKE ? OR
	LOWER(study_sessions.subject) LIKE ? OR
        LOWER(study_sessions.summary) LIKE ? OR
        LOWER(buildings.name) LIKE ? OR
        LOWER(schools.name) LIKE ?
        ", "%#{search.downcase}%", "%#{search.downcase}%","%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
  end

end
