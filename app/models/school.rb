class School < ActiveRecord::Base
  has_many :buildings, :dependent => :destroy
  accepts_nested_attributes_for :buildings#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  has_many :rooms, through: :buildings
  has_many :study_sessions, through: :buildings
  has_many :users

  validates :name, presence: true

  def self.search search
    where("
        LOWER(name) LIKE ?
        ", "%#{search.downcase}%")
  end

end
