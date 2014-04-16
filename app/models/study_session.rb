class StudySession < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  has_many :notes

  validates :name, presence: true
  validates :name, length: { minimum: 5 }
  validates :name, exclusion: { in: %w(anal anus arse ass ballsack balls bastard bitch biatch bloody blowjob blow job bollock bollok boner boob bugger bum butt buttplug clitoris cock coon crap cunt damn dick dildo dyke fag feck fellate fellatio felching fuck fudgepacker flange goddamn hell homo jerk jizz knobend labia lmao lmfao muff nigger nigga omg penis piss poop pube pussy queer scrotum sex shit sh1t slut smegma spunk tit tosser turd twat vagina wank whore wtf),
    message: "%{value} is a naughty, naughty word." }
  validates :subject, presence: true
  validates :subject, length: { minimum: 2 }
  validates :subject, exclusion: { in: %w(anal anus arse ass ballsack balls bastard bitch biatch bloody blowjob blow job bollock bollok boner boob bugger bum butt buttplug clitoris cock coon crap cunt damn dick dildo dyke fag feck fellate fellatio felching fuck fudgepacker flange goddamn hell homo jerk jizz knobend labia lmao lmfao muff nigger nigga omg penis piss poop pube pussy queer scrotum sex shit sh1t slut smegma spunk tit tosser turd twat vagina wank whore wtf),
    message: "%{value} is a naughty, naughty word." }
  validates :summary, presence: true
  validates :summary, length: { minimum: 5 }
  validates :summary, exclusion: { in: %w(anal anus arse ass ballsack balls bastard bitch biatch bloody blowjob blow job bollock bollok boner boob bugger bum butt buttplug clitoris cock coon crap cunt damn dick dildo dyke fag feck fellate fellatio felching fuck fudgepacker flange goddamn hell homo jerk jizz knobend labia lmao lmfao muff nigger nigga omg penis piss poop pube pussy queer scrotum sex shit sh1t slut smegma spunk tit tosser turd twat vagina wank whore wtf),
    message: "%{value} is a naughty, naughty word." }
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
