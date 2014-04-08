class Building < ActiveRecord::Base
  belongs_to :school
  has_many :rooms
  has_many :study_sessions, through: :rooms
  accepts_nested_attributes_for :rooms#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  def self.search search
    joins([:school]).where("
        LOWER(buildings.name) LIKE ? OR 
        LOWER(schools.name) LIKE ?
        ", "%#{search.downcase}%", "%#{search.downcase}%")
  end


end
