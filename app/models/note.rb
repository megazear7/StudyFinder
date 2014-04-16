class Note < ActiveRecord::Base
  belongs_to :study_session
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/  
  validates :summary, presence: true
  validates :summary, length: { minimum: 2 }
  validates :summary, exclusion: { in: %w(anal anus arse ass ballsack balls bastard bitch biatch bloody blowjob blow job bollock bollok boner boob bugger bum butt buttplug clitoris cock coon crap cunt damn dick dildo dyke fag feck fellate fellatio felching fuck fudgepacker flange goddamn hell homo jerk jizz knobend labia lmao lmfao muff nigger nigga omg penis piss poop pube pussy queer scrotum sex shit sh1t slut smegma spunk tit tosser turd twat vagina wank whore wtf),
    message: "%{value} is a naughty, naughty word." }
end
