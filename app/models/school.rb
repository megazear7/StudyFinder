class School < ActiveRecord::Base
  has_many :buildings, :dependent => :destroy
  accepts_nested_attributes_for :buildings#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  has_many :rooms, through: :buildings
  has_many :study_sessions, through: :buildings
  has_many :users

  validates :name, presence: true
  validates :name, exclusion: { in: %w(anal anus arse ass ballsack balls bastard bitch biatch bloody blowjob blow job bollock bollok boner boob bugger bum butt buttplug clitoris cock coon crap cunt damn dick dildo dyke fag feck fellate fellatio felching fuck fudgepacker flange goddamn hell homo jerk jizz knobend labia lmao lmfao muff nigger nigga omg penis piss poop pube pussy queer scrotum sex shit sh1t slut smegma spunk tit tosser turd twat vagina wank whore wtf),
    message: "%{value} is a naughty, naughty word." }

  def self.search search
    where("
        LOWER(name) LIKE ?
        ", "%#{search.downcase}%")
  end

end
