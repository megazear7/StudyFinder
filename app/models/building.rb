class Building < ActiveRecord::Base
  belongs_to :school
  has_many :rooms
  has_many :study_sessions, through: :rooms
  accepts_nested_attributes_for :rooms#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  validates :name, exclusion: { in: %w(anal anus arse ass ballsack balls bastard bitch biatch bloody blowjob blow job bollock bollok boner boob bugger bum butt buttplug clitoris cock coon crap cunt damn dick dildo dyke fag feck fellate fellatio felching fuck fudgepacker flange goddamn hell homo jerk jizz knobend labia lmao lmfao muff nigger nigga omg penis piss poop pube pussy queer scrotum sex shit sh1t slut smegma spunk tit tosser turd twat vagina wank whore wtf),
    message: "%{value} is a naughty, naughty word." }

  validates :name, presence: true
  def self.search search
    joins([:school]).where("
        LOWER(buildings.name) LIKE ? OR 
        LOWER(schools.name) LIKE ?
        ", "%#{search.downcase}%", "%#{search.downcase}%")
  end


end
