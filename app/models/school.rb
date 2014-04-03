class School < ActiveRecord::Base
  has_many :buildings, :dependent => :destroy
  accepts_nested_attributes_for :buildings#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  has_many :rooms, through: :buildings
  has_many :users
end
