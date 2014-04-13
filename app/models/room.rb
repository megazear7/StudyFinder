class Room < ActiveRecord::Base
  belongs_to :building
  has_many :study_sessions
  
  validates :room_number, presence: true

  def self.search search
    joins([:building => :school]).where("
        room_number LIKE ? OR 
        LOWER(buildings.name) LIKE ? OR
        LOWER(schools.name) LIKE ?
        ", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
  end

end
