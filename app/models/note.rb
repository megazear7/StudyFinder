class Note < ActiveRecord::Base
  belongs_to :study_session
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/  
  validates :summary, presence: true
  validates :summary, length: { minimum: 5 }
end
