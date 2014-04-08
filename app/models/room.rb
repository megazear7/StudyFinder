class Room < ActiveRecord::Base
  belongs_to :building
  has_many :study_sessions

  def self.search search
    joins([:building]).where("
        room_number LIKE ? OR 
        LOWER(buildings.name) LIKE ?
        ", "%#{search.downcase}%", "%#{search.downcase}%")
  end

end
