class StudySession < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  has_many :notes

  validates :name, presence: true
  validates :name, length: { minimum: 5 }
  validates :subject, presence: true
  validates :subject, length: { minimum: 5 }
  validates :summary, presence: true
  validates :summary, length: { minimum: 5 }
  validates :meeting_time, presence: true
  validate :meeting_time_cannot_be_in_the_past
 
  def meeting_time_cannot_be_in_the_past
    if meeting_time.present? && meeting_time < Date.today
      errors.add(:meeting_time, "can't be in the past")
    end
  end
 

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
