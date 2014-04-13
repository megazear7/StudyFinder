class Room < ActiveRecord::Base
  belongs_to :building
  has_many :study_sessions
  
  validates :room_number, presence: true
  validates :room_number, numericality: { only_integer: true, less_than_or_equal_to: 9999, greater_than_or_equal_to: 1}
  validates :room_number, uniqueness: { case_sensitive: false }

  #validates :room_number, numericality: { }
  def self.search search
    joins([:building => :school]).where("
        room_number LIKE ? OR 
        LOWER(buildings.name) LIKE ? OR
        LOWER(schools.name) LIKE ?
        ", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
  end

end
